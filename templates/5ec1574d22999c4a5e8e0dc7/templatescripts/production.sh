#!/bin/bash
if [ "$USE_PNPM" == "false" ]
then
  echo 'Starting NPM Install'
  npm install --legacy-peer-deps
  echo 'Finished NPM Install, starting Build'
  echo y | npm run build
  echo 'Finished Build'
else
  export NODE_ENV=development
  echo 'Starting PNPM Install'
  pnpm install
  echo 'Finished PNPM Install, starting Build'
  echo y | pnpm run build
  echo 'Finished Build'
fi

