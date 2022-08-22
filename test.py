import json

with open("test.json","r",encoding = 'utf-8') as json_fp:
    contents = json_fp.read()
    json_data = json.loads(contents)

print(json_data)