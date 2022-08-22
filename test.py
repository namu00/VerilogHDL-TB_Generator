import re

fp = open("test.txt", 'r')
data = fp.readlines()
fp.close()


def get_module_name(module_data):
    for str in module_data:
        if (str.find("module") != -1):
            name = str.replace("\n","")
            name = name.replace(";","").split(" ")
            name = name[1]
            return name.split("(")[0]


def module_instance(module_data):
    m_name = get_module_name(module_data)
    instance_string = m_name + " "
    for str in module_data:
        if (str.find("module") != -1):
            name = str.replace("\n","")
            name = name.split(" ")
            name = name[1].replace(m_name,"test_unit")

            instance_string = instance_string + name
            break
    return instance_string

def get_io(module_data):
    inout = []
    for str in module_data:
        if (str.find("input ") != -1):
            inout.append(str.replace("input", "reg",1))
        elif (str.find("output reg ") != -1):
            inout.append(str.replace("output reg", "wire",1))
        elif (str.find("output ") != -1):
            inout.append(str.replace("output", "wire",1))

    return inout
    
print(get_io(data))