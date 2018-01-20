#!/bin/bash

./yaml2json.py

git status | grep autogen/data.json
RET=$?
echo $RET

if [[ $RET == 0 ]]; then
  git add autogen/data.json
  git commit -m 'Update data.json'
fi
