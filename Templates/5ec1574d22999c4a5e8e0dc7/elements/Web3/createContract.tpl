/*
path: createContract.tpl
keyPath: elements/Web3/createContract.tpl
unique_id: MPxG2lvu
options:
  - name: contract
    display: Contract (SOL)
    type: code
    options: ''
  - name: filename
    display: Filename (without extension)
    type: text
  - name: arguments
    display: Arguments
    type: text
settings:
  - name: Packages
    value: '"solc": "0.8.17", "web3": "^4.8.0",' 
  - name: BackendPackages
    value: '"solc": "0.8.17", "web3": "^4.8.0",' 
*/
{{ addExtraFile('back-end/contracts/' ~ element.values.filename ~ '.sol', element.values.contract) }}
const compileContract = () => {
  const contractFilePath = 'back-end/contracts/{{ element.values.filename | raw }}.sol'
  const fileName = '{{ element.values.filename }}'
  const contractName = '{{ element.values.filename }}'
  const fs = require ("fs")
  const sourceCode = fs.readFileSync(contractFilePath, 'utf8')

  const input = {
    language: 'Solidity',
    sources: {
      [fileName]: {
        content: sourceCode,
      },
    },
    settings: {
      outputSelection: {
        '*': {
          '*': ['*'],
        },
      },
    },
  }

  const solc = require('solc')
  const compiledCode = JSON.parse(solc.compile(JSON.stringify(input)))
  const bytecode = compiledCode.contracts[fileName][contractName].evm.bytecode.object
  const abi = compiledCode.contracts[fileName][contractName].abi

  return {
    bytecode: bytecode,
    abi: JSON.stringify(abi)
  }  
}

async function deploy(compiledContract) {
  const bytecode = compiledContract.bytecode
  const abi = compiledContract.abi
  
  var gasprice = await web3.eth.getGasPrice()
  const myContract = new web3.eth.Contract(JSON.parse(abi))
  myContract.handleRevert = true

  const contractDeployer = myContract.deploy({
    data: '0x' + bytecode,
    {% if element.values.arguments %}arguments: {{ element.values.arguments }}{% endif %}
  })

  const gas = await contractDeployer.estimateGas({ from: from })
	
  try {
    const tx = await contractDeployer.send({
      from: from,
      gas: web3.utils.toHex(gas),
      gasPrice: gasprice,
    })
		
    return tx.options.address
  } catch (error) {
    console.error(error)
  }
}
const compiledContract = compileContract()
const contractAddress = await deploy(compiledContract)
