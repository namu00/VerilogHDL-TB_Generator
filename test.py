from pickle import NONE
import json5
import jsonschema
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

data = open("test.json")
data = data.read()

obj = json5.loads(data)
jsonschema.Draft6Validator(wavejson_schema).validate(obj)

print(obj)

for s in obj["signal"]:
    if "name" in s:
        print(s["name"])