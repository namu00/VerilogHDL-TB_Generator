import re
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

f = open("jcnt.v",'r')
data = f.readlines()
data = ''.join(data)
data = data.split(";")
for str in get_io(data):
    print(str)
