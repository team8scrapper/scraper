import json

with open("template.json", 'r') as fd:
    file = fd.read()

file = json.loads(file)

stores = list(file)
# print(file)
# print(stores)

for k, v in file.items():
    print(v['x_price'])
