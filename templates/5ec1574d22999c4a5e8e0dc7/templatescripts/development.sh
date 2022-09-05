#!/bin/bash
if [ "$USE_PNPM" == "false" ]
then
  echo 'Starting NPM Install'
  npm install
  echo 'Finished NPM Install'
else
  export NODE_ENV=development
  echo 'Starting PNPM Install'
  pnpm install --prefer-offline
  echo 'Finished PNPM Install'
fi

