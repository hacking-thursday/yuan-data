#!/bin/bash

setup_git() {
    git config --global user.email "travis@travis-ci.org"
    git config --global user.name "Travis CI"
}

update_file() {
    git add autogen/data.json
    git commit --message "Travis build: $TRAVIS_BUILD_NUMBER [ci skip]"
    git push https://${GITHUB_TOKEN}@github.com/hacking-thursday/yuan-data.git HEAD:master
}

git status | grep autogen/data.json

RET=$?

if [[ $RET == 0 ]]; then
    setup_git
    update_file
fi
