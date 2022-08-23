import argparse
import json5
import jsonschema

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

#Exception Handller Section#
def file_test(*name):
    ext1 = name[0]
    ext2 = name[1]

    ext1 = ext1.split(".")[-1]
    ext2 = ext2.split(".")[-1]
    if (ext1 == "v" and ext2 == "json"): return True
    else: return False

def print_err(code):
    RED = "\033[91m"
    WHITE = "\033[37m"

    print(RED+code+WHITE)
    return False
#Exception Handller Section#

#Testbench Formatting Section#
def get_io(module_data):
    #function for return signal identification state
    #replace input/output Keyword to reg/wire
    inout = []
    for str in module_data:
        data = ""
        if (str.find("input ") != -1):
            data = str.replace("input", "reg")
            data += ";"
            inout.append(data)

        elif (str.find("output reg ") != -1):
            data = str.replace("output reg", "wire")
            data += ";"
            inout.append(data)
        elif (str.find("output ") != -1):
            data = str.replace("output", "wire")
            data += ";"
            inout.append(data)
            
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
                #module [module_name]([TERMINALS]) --> module test_unit([TERMINALS])
            instance_string = instance_string.replace("module", m_name)
                #module test_unit([TERMINALS]) --> [module_name] test_unit([TERMINALS])
            break
    return instance_string

def wave_interpreter(name, data):
    high = "1hHu"
    low = "0lLd"
    bus = "="

    tab = "    "
    sig_info = [data[0]]
    ret_string = ""

    for i in range(1,len(data)):
        if data[i] == '.': sig_info.append(sig_info[(i - 1)])
        else: sig_info.append(data[i])
    
    for c in sig_info:
        ret_string += (tab + tab) #indentation
        if c in high:
            ret_string += (name + " = 1'b1; #2;\n")
        else:
            ret_string += (name + " = 1'b0; #2;\n")
    
    return ret_string


def testvector_gen(json):
    #return testvector states via render json
    tab = "    "
    wave = None #Wavedrome JSON data
    input = [] #Input Signal list(testvector parameter)
    testvector_string = "" #Testvector String

    start = (tab + "initial begin\n")
    end = (tab + "end\n\n")

    clk_gen = (tab + "initial" #CLK state
    + " clk = 1'b0;\n"
    + tab + "always #1 clk = ~clk;\n\n")

    with open(json) as f:
        #Load Json file
        data = f.read()
        wave = json5.loads(data)
        jsonschema.Draft6Validator(wavejson_schema).validate(wave)
    
    for string in wave["signal"]: #Input Signal Extraction
        if string == {}: break
        else: input.append(string)
    
    for string in input: #clk generate & Remove CLK from json data
        if string["name"] == "clk": 
            testvector_string += clk_gen
            input.remove(string)

    for string in input:
        if string.get("data") == None:
            testvector_string += start
            testvector_string += wave_interpreter(string["name"], string["wave"])
            testvector_string += end
    return testvector_string
#Testbench Formatting Section#

#Root Function#
def tb_gen(module, json):

    if file_test(module,json) == False:
        #File Extension Check Failed
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
            "module testbench();\n",    #module testbench();
            inout,                      #   input/output list
            instance,                   #   testunit instance
            testvector,                 #   testvactors
            "endmodule"                 #endmodule
            ]
        
        #Write Testbench.v
        with open("testbench.v", 'w', encoding='utf-8') as tb_fp:
            for i in range(0,len(tb)):
                tb_fp.writelines(tb[i])
        
        return True
    except:
        #Error Message
        return print_err("\t.v file verification failed!")
#Root Function#

if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.epilog = __doc__
    parser.add_argument("module_src", help="TestTarget VerilogHDL source file")
    parser.add_argument("json_src", help="WaveJSON source file")
    parser.add_argument("-v", "--verbose", action="store_true",
                        help="Show generated result of testbench.")
    args = parser.parse_args()

    #Take Two Argument as Default.
    #Argument Sequence: [VerilogHDL].v [Wavedrom].json
    #Please Follow the Sequence.

    if args.verbose:
        if(tb_gen(args.module_src, args.json_src)):
            with open("testbench.v", 'r', encoding='utf-8') as f:
                print(f.read())
    else:
        tb_gen(args.module_src, args.json_src)