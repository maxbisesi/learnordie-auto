#!/bin/zsh
echo "Shoulda sent it sooner"
# Set environment variables from .env and set NODE_ENV to test
source <(dotenv-export | sed 's/\\n/\n/g')
export NODE_ENV=test
export SEND_IT=sooner

npx dotenv cucumber-js /features --require-module @babel/register --require /steps