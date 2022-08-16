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

def file_open(file_name): #파일이 없으면 만들고, 있으면 수정
    fp = open(file_name,"w",encoding="utf-8")
    return fp

def read_wave(): #Read .json file
    pass

def tv_gen(): #TestVector Generator
    pass

def io_list(signal):
    pass
if __name__ == "__main__":
    parser = argparse.ArgumentParser(formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.epilog = __doc__
    #parser.add_argument("-h","--help", action = "store_true")
    parser.add_argument("-v","--verbose", action = "store_true",
                        help = "Show generated result of testbench.")
    parser.add_argument("--rename",dest = "rename", action = "store",
                        help = "Rename testbench.v file name")
    parser.add_argument("-w","--watch", dest = "watch",
                        help = "Watch Wavedrom Wave via ASCII art")
    args = parser.parse_args()
    
    if args.rename:
        file_name = str(args.rename) + ".v"
        print(file_name)
        #fp = file_open(file_name)
    elif args.watch:
        print(args.watch)
    else:
        file_name = "testbench.v"
        #fp = file_open(file_name)
        
        