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


def get_io(module_data):
    inout = []
    for str in module_data:
        if (str.find("input") != -1):
            inout.append(str.replace("input", "reg"))
        elif (str.find("output") != -1):
            inout.append(str.replace("output", "wire"))

    return inout


def get_module_name(module_data):
    for str in module_data:
        if (str.find("module") != -1):
            name = str.replace("\n","")
            name = name.replace(";","").split(" ")
            name = name[1]
            return name.split("(")[0]

def module_instance(module_data):
    m_name = get_module_name(module_data)
    instance_string = str(m_name) + " "
    for string in module_data:
        if (string.find("module") != -1):
            name = string.replace("\n","")
            name = name.split(" ")
            name = name[1].replace(m_name,"test_unit")

            instance_string = instance_string + name
            break
    return instance_string


def testvector_gen(json):
    string = "initial begin end\n"
    return string


def tb_gen(module, json):

    #String format
    start = "module testbench();\n"
    tab = "    "
    end = "endmodule"

    #Get module data from .v file
    module_fp = open(module, 'r', encoding='utf-8')
    v_data = module_fp.readlines()  # read .v file data
    module_fp.close()

    #Get input/output signals from .v file
    inout = get_io(v_data)

    #Create module instance
    instance = "\n" + tab + module_instance(v_data) + "\n"

    #Create Testvector via Wavedrom JSON
    testvector = "\n" + testvector_gen(json)

    #testbench contents
    tb = [
        start,
        inout,
        instance,
        testvector,
        end
        ]
    tb_fp = open("testbench.v", 'w', encoding='utf-8')
    for i in range(0,len(tb)):
        tb_fp.writelines(tb[i])
    tb_fp.close()



if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.epilog = __doc__
    parser.add_argument("module", help="Test Target VerilogHDL source file")
    parser.add_argument("json", help="WaveJSON source file")
    parser.add_argument("-v", "--verbose",
                        help="Show generated result of testbench.")
    args = parser.parse_args()

    if args.verbose:
        tb_gen(args.module, args.json)
        tb = open("testbench.v", 'r', encoding='utf-8')
        data = tb.read()
        tb.close()

        print("\n", data, "\n")
    else:
        tb_gen(args.module, args.json)