/*
path: web3Compiler.tpl
keyPath: elements/Web3/web3Compiler.tpl
unique_id: ZQcH3abi
*/

const compileContract = (fileName = '', folderPath = 'contracts') => {
  const path = require('path')
  const fs = require ('fs')
  const solc = require('solc')

  const contractFilePath = `${__dirname}/${folderPath}/${fileName}.sol`
  const contractName = fileName
  try {
    const sourceCode = fs.readFileSync(contractFilePath, 'utf8')

    function findImports(importPath) {
      if (importPath.startsWith('@openzeppelin')) {
        const resolvedPath = path.resolve(__dirname, '../../node_modules', importPath);
        return { contents: fs.readFileSync(resolvedPath, 'utf8') };
      } else {
        return { error: 'File not found' };
      }
    }

    const input = {
      language: 'Solidity',
      sources: {
        [fileName]: {
          content: sourceCode,
        },
      },
      settings: {
        optimizer: {
            enabled: true,
            runs: 200, // Lower value for smaller contract size
          },
        outputSelection: {
          '*': {
            '*': ['*'],
          },
        },
      },
    }

    const compiledCode = JSON.parse(solc.compile(JSON.stringify(input), { import: findImports }))
    const bytecode = compiledCode.contracts[fileName][contractName].evm.bytecode.object
    const abi = compiledCode.contracts[fileName][contractName].abi

    return {
      bytecode: bytecode,
      abi: JSON.stringify(abi)
    }  
  } catch (error) {
      console.error('Error compiling contract:', error)
      throw new Error('Contract compilation failed.')
  }
}