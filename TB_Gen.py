#!/usr/bin/python3
import argparse
import json5
import jsonschema

__doc__ = """
TB_Gen.py is a tool to create "testbench.v" file based on Wavedrom JSON.

Example:
    tbgen.py                [TARGET_MODULE.v] [WAVEDROM.json]
    tbgen.py -v             [TARGET_MODULE.v] [WAVEDROM.json]
    tbgen.py --verbose      [TARGET_MODULE.v] [WAVEDROM.json]
    tbgen.py -p [NUM]       [TARGET_MODULE.v] [WAVEDROM.json]
    tbgen.py -period [NUM]  [TARGET_MODULE.v] [WAVEDROM.json]

"""
#===============================Json Schema===============================#
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
#===============================Json Schema===============================#

#===============================Exception Handller===============================#
def file_test(*name):
    #File extension Test Function
    ext1 = name[0].split(".")[-1] #get file extension
    ext2 = name[1].split(".")[-1] #get file extension

    if (ext1 == "v" and ext2 == "json"): return True #check extension
    else: return False

def print_err(code):
    print("\033[91m"+code+"\033[37m") #print Error Message
    return False
#===============================Exception Handller===============================#

#===============================testbench formatter===============================#
def get_io(module_data):
    #Get input/output signal information from .v file
    #Return testbench formatted i/o state 
    inout = []
    data = ''.join(module_data)
    data = data.split(";")

    for string in data:
        data = ""
        if (string.find("input ") != -1):           #Replace input_ --> reg
            data = string.replace("input", "reg")
            data += ";"
            inout.append(data)

        elif (string.find("output reg ") != -1):    #Replace output_reg_ --> wire
            data = string.replace("output reg", "wire")
            data += ";"
            inout.append(data)

        elif (string.find("output ") != -1):        #Replace output_ --> wire
            data = string.replace("output", "wire")
            data += ";"
            inout.append(data)

    inout.append("\n")
    return inout

def get_module_name(module_data):
    #Get module name from .v file
    #Return module name
    for string in module_data:
        if (string.find("module ") != -1):
            name = string.replace("\n","")
            name = name.replace(";","").split(" ")
            name = name[1]
            return name.split("(")[0].strip()

def module_instance(module_data):
    #Return Module Instance State
    m_name = get_module_name(module_data) #get module name
    instance_string = "\n    "
    for string in module_data:
        if (string.find("module ") != -1):
            instance_string += string.replace(m_name,"test_unit") 
                #module [module_name]([TERMINALS]); --> module test_unit([TERMINALS]);
            instance_string = instance_string.replace("module", m_name)
                #module test_unit([TERMINALS]); --> [module_name] test_unit([TERMINALS]);
            break
    return instance_string
#===============================testbench formatter===============================#

#===============================testvector generator===============================#
def wave_interpreter(sig_info, has_it_clk, period):
    #Convert wavedrom signals to Verilog syntax
    high = "1hHu"                       #define High Signal
    low = "0lLd"                        #define Low Signal
    tab = "        "                    #Tabs for Indent
    name = sig_info["name"]             #get signal name from argument "sig_info"
    json_wave = sig_info["wave"]        #get json wavedata from argument "sig_info"
    delay = [("#"+ period + "; "),"@(negedge clk); "][has_it_clk] # Select "Sequential Logic Delay" OR "Non CLK-Dependent Logic Delay"
    repeat = 0                          #repeat counter
    ret_str = ""                        #return String, Verilog State

    if sig_info.get("data") == None:
        for c in json_wave:
            if c == '.': repeat += 1
            elif c in high:
                ret_str += tab #Indent
                if repeat != 0:
                    ret_str += ("repeat("+str(repeat)+") " + delay + "\n" + tab)
                ret_str += (name + " = 1'b1; " + delay + "\n")
                repeat = 0

            elif c in low:
                ret_str += tab
                if repeat != 0:
                    ret_str += ("repeat("+str(repeat)+") " + delay + "\n" + tab)
                ret_str += (name + " = 1'b0; " + delay + "\n")
                repeat = 0
            
    elif sig_info.get("data") != None:
        prev = ""
        size = str(len(sig_info["data"][0]))
        for data in sig_info["data"]:
            if prev == data: repeat +=1
            else:
                ret_str += tab #Indent
                if repeat != 0:
                    ret_str += ("repeat("+str(repeat)+") " + delay + "\n" + tab)
                ret_str += (name + " = " + size + "'b" + data + ";" + delay + "\n")
                prev = data
                repeat = 0

    return ret_str

def testvector_gen(json, period):
    #Return testvector states via rendering json
    tab = "    "
    wave = None             #Wavedrome JSON data
    input = []              #Input Signal list(testvector parameter)
    testvector_string = "\n"  #Testvector String
    stop_time = 0           #Simulation Stop Time
    has_it_clk = 0          #CLK Flag

    start = (tab + "initial begin\n")
    end = (tab + "end\n\n")

    clk_gen = (tab + "initial" #CLK state
    + " clk = 1'b1;\n"
    + tab + "always #" + period + " clk = ~clk;\n\n")

    with open(json) as f:
        #Load Json file
        data = f.read()
        wave = json5.loads(data)
        jsonschema.Draft6Validator(wavejson_schema).validate(wave)
    
    for string in wave["signal"]:       #input signal extraction
        if string == {}: break
        else: input.append(string)    
    
    for string in input:                #Create Testvector
        stop_time = max(stop_time,len(string["wave"]))

        if string["name"] == "clk":     #CLK Generation
            testvector_string += clk_gen
            has_it_clk = 1

        else:                           #Create Testvector State
            testvector_string += start
            testvector_string += wave_interpreter(string, has_it_clk, period)
            testvector_string += end
    
    stop_time = stop_time * int(period)
    if(has_it_clk): stop_time *= 2      #Becasue, Clock is consisted of High-Low Set
    testvector_string += (tab + "initial begin\n"
                         +(tab + tab) +"#" + str(stop_time) + "; $stop;\n"
                         +tab + "end\n")
    
    return testvector_string
#===============================testvector generator===============================#

#===============================TESTBENCH generator===============================#
def tb_gen(module, json, period="1"):
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
        instance = module_instance(v_data)

        try:
            #Create Testvector via Wavedrom JSON
            testvector = testvector_gen(json, period)
        except:
            return print_err("\t Testvector Generation Failed!")
    
        #testbench contents
        tb = [
            "`timescale 1ns/1ns\n\n",
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
#===============================TESTBENCH generator===============================#

if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.epilog = __doc__
    parser.add_argument("module_src", help="TestTarget VerilogHDL source file")
    parser.add_argument("json_src", help="WaveJSON source file")
    parser.add_argument("-p", "--period", action="store",
                        help="Set Clock/Delay Period")
    parser.add_argument("-v", "--verbose", action="store_true",
                        help="Show generated result of testbench.")
    args = parser.parse_args()

    #Take Two Argument as Default.
    #Argument Sequence: [VerilogHDL].v [Wavedrom].json
    #Please Follow the Sequence.
    
    if args.period != None:
        tb_gen(args.module_src, args.json_src, args.period)

    elif args.verbose:
        if(tb_gen(args.module_src, args.json_src)):
            with open("testbench.v", 'r', encoding='utf-8') as f:
                print(f.read())
    else:
        tb_gen(args.module_src, args.json_src)
