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
def get_io(module):
    pass 
def tb_gen(module, json):
    pass
        
if __name__ == "__main__":
    parser = argparse.ArgumentParser(formatter_class = argparse.RawDescriptionHelpFormatter)
    parser.epilog = __doc__
    parser.add_argument("t_target", help="Test Target VerilogHDL source file")
    parser.add_argument("json", help="WaveJSON source file")
    parser.add_argument("-v","--verbose",
                        help = "Show generated result of testbench.")
    args = parser.parse_args()
    
    if args.verbose:
        pass
    else:
        tb_gen(args.t_target, args.json)