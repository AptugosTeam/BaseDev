#!/bin/bash
export NODE_ENV=development
if which npm
then
  echo 'Starting NPM Install'
  pnpm install --loglevel 2>&1 
  echo 'Finished NPM Install, starting Build'
  echo y | npm run build
  echo 'Finished Build'
else
  echo 'NPM not found'
fi
