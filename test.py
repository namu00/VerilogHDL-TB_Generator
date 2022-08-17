fp = open("test.py",'r')
data = fp.readlines()
fp.close()

print(type(data))
print(data[0])