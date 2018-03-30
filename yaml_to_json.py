import yaml
import json

import sys

file = open(sys.argv[1])


obj = yaml.load(file.read()) 
op = json.dumps(obj, indent=4)
print op
