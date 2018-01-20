#!/usr/bin/env python

import yaml
import json
import os

DIR = './projects'
TARGET_DIR = './autogen'

json_data = []

for y in os.listdir(DIR):
    with open(os.path.join(DIR, y)) as f:
        json_data.append(yaml.load(f))

with open(os.path.join(TARGET_DIR, 'data.json'), 'w') as f:
    json.dump({"projects": json_data}, f)
