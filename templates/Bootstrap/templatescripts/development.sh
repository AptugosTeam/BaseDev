#!/bin/bash
export NODE_ENV=development
if which npm
then
  echo 'Starting NPM Install'
  cd front-end
  npm install --loglevel timing 2>&1 
  echo 'Finished NPM Install'
else
  echo 'NPM not found'
fi
