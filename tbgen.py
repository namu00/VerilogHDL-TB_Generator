import argparse
import itertools
import json5
import jsonschema
import time
import traceback
import sys

__doc__ = """
testbench_generator is a tool to create "testbench.v" file based on Wavedrom JSON.

Usage:
    tbgen.py [TARGET_MODULE.v] [WAVEDROM.json]
    tbgen.py [OPTIONS] [TESTBENCH.v]
    tbgen.py [OPTIONS] [WAVEDROM.json]
    tbgen.py [OPTIONS] [TARGET_MODULE.v] [WAVEDROM.json]
Generate "Testbench.v" file based on "WAVEDROM.json" and "TARGET_MODULE.v" files.

Optional Arguments:
    -h  --help           Show Guides of Using tool
    -v  --verbose        Show generated result of testbench.
        --rename         Rename testbench.v file name
    -w  --watch          Watch Wavedrom Wave via ASCII art

Example:
```
# $ tbgen.py ./Verilog/not.v ./wavedrom/not.json
# $ tbgen.py -w ./wavedrom/not.json
```
"""

wavejson_schema = {
	"type": "object",
	"properties": {
		"config": {
			"type": "object",
			"properties": {
				"hscale": {"type": "number"}
			}
		},
		"signal": {
			"type": "array",
			"items": {
				"type": "object",
				"properties": {
					"name": {"type": "string"},
					"wave": {"type": "string"},
					"data": {
						"type": ["array", "string"],
						"items": {"type": "string"}
					},
					"phase": {"type": "number"},
					"period": {"type": "number"}
				},
				"additionalProperties": False
			}
		}
	},
	"additionalProperties": False
}
def read_json():
    pass

def ret_data(file_name, line_flag):
    #flag를 사용하는 이유는,
    #시험 모듈의 모듈명을 추출하거나, <-- flag == 1
    #json raw데이터를 통째로 가져오기 위함입니다. <-- flag == 0
    
    #if line_flag == 0: return all line data
    #if line_flag == 1: return first line data
    try:
        fp = open(file_name,'r',encoding = "utf-8")
        
        if line_flag: 
            data = fp.readlines()
            fp.close()
            
            return data[0]
        else: 
            data = fp.read()
            fp.close()
            
            return data
    
    except:
        print("File \"" + file_name + "\"Does Not Exist")
        
if __name__ == "__main__":
    parser = argparse.ArgumentParser(formatter_class = argparse.RawDescriptionHelpFormatter)
    parser.epilog = __doc__
    parser.add_argument("json", help="WaveJSON source file")
    parser.add_argument("t_target", help="Test Target VerilogHDL source file")
    parser.add_argument("-v","--verbose",
                        help = "Show generated result of testbench.")
    args = parser.parse_args()
    
    if args.verbose:        
        json_fp = open(str(args.verbose),"r")
        data = json_fp.read()
        json_fp.close()
        
        
        
        
