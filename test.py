import re

fp = open("test.txt",'r')
data = fp.readlines()
fp.close()

for str in data:
    temp = str
    temp = temp.replace(";","")
    temp = temp.split(" ")
    print(temp[-1])