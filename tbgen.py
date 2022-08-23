import argparse
import itertools
import json5
import jsonschema
import time
import traceback
import sys
import re

__doc__ = """
testbench_generator is a tool to create "testbench.v" file based on Wavedrom JSON.

Usage:
    tbgen.py             [TARGET_MODULE.v] [WAVEDROM.json]
    tbgen.py -v          [TARGET_MODULE.v] [WAVEDROM.json]
    tbgen.py --verbose   [TARGET_MODULE.v] [WAVEDROM.json]
Generate "Testbench.v" file based on "WAVEDROM.json" and "TARGET_MODULE.v" files.

Optional Arguments:
    -h  --help           Show Guides of Using tool
    -v  --verbose        Show generated result of testbench.

Example:
```
# $ tbgen.py ./Verilog/not.v ./wavedrom/not.json
# $ tbgen.py -v ./Verilog/not.v ./wavedrom/not.json
```
"""

wavejson_schema = {
	"type": "object",
	"properties": {
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

def file_test(*name):
    v = name[0]
    json = name[1]

    if (v[-2:] == ".v" and json[-5:] == ".json"): return True
    else: return False

def print_err(code):
    RED = "\033[91m"
    WHITE = "\033[37m"

    print(RED+code+WHITE)

def get_io(module_data):
    #function for return signal identification state
    #replace input/output Keyword to reg/wire
    inout = []
    for str in module_data:
        if (str.find("input ") != -1):
            inout.append(str.replace("input", "reg"))
        elif (str.find("output reg ") != -1):
            inout.append(str.replace("output reg", "wire"))
        elif (str.find("output ") != -1):
            inout.append(str.replace("output", "wire"))

    return inout

def get_module_name(module_data):
    #get module name from .v file
    for str in module_data:
        if (str.find("module") != -1):
            name = str.replace("\n","")
            name = name.replace(";","").split(" ")
            name = name[1]
            return name.split("(")[0]

def module_instance(module_data):
    #function for testunit instance state
    #return testunit instance state
    m_name = get_module_name(module_data)
    instance_string = "    "
    for string in module_data:
        if (string.find("module ") != -1):
            instance_string += string.replace(m_name,"test_unit")
            instance_string = instance_string.replace("module", m_name)
            break
    return instance_string

def testvector_gen(json):
    #return testvector states via render json
    tab = "    "
    wave = None #Wavedrome JSON data
    input = [] #Input Signal list(testvector parameter)
    testvector_string = "" #Testvector String
    clk_gen = (tab + "initial"
    + " clk = 1'b0;\n"
    + tab + "always #1 clk = ~clk;\n")
    with open(json) as f:
        #Load Json file
        data = f.read()
        wave = json5.loads(data)
        jsonschema.Draft6Validator(wavejson_schema).validate(wave)
    
    for string in wave["signal"]:
        if string == {}: break
        else: input.append(string)
    
    for string in input:
        if string["name"] == "clk": 
            testvector_string += clk_gen
            input.remove(string)

    return testvector_string
def tb_gen(module, json):

    #String format
    start = "module testbench();\n"
    tab = "    "
    end = "endmodule"

    if file_test(module,json) == False:
        return print_err("\tFile Extension Error!")

    try:
        #Get module data from .v file
        with open(module, 'r', encoding='utf-8') as module_fp:
            v_data = module_fp.readlines()  # read .v file data

        #Get input/output signals from .v file
        inout = get_io(v_data)

        #Create module instance
        instance = "\n" + module_instance(v_data)

        #Create Testvector via Wavedrom JSON
        testvector = "\n" + testvector_gen(json)

        #testbench contents
        tb = [
            start,       #module testbench();
            inout,       #   input/output list
            instance,    #   testunit instance
            testvector,  #   testvactors
            end          #endmodule
            ]
        
        #Write Testbench.v
        with open("testbench.v", 'w', encoding='utf-8') as tb_fp:
            for i in range(0,len(tb)):
                tb_fp.writelines(tb[i])
        
        return True
    except:
        #Error Message
        return print_err("\t.v file verification failed!")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.epilog = __doc__
    parser.add_argument("module_src", help="TestTarget VerilogHDL source file")
    parser.add_argument("json_src", help="WaveJSON source file")
    parser.add_argument("-v", "--verbose", action="store_true",
                        help="Show generated result of testbench.")
    args = parser.parse_args()

    if args.verbose:
        if(tb_gen(args.module_src, args.json_src)):
            with open("testbench.v", 'r', encoding='utf-8') as f:
                print(f.read())
    else:
        tb_gen(args.module_src, args.json_src)