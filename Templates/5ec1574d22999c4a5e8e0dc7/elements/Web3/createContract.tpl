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
  - name: customroute
    display: Custom Route
    type: text
  - name: senderaddress
    display: Sender Address
    type: text
  - name: senderprivatekey
    display: Sender Private Key
    type: text    
settings:
  - name: Packages
    value: '"solc": "0.8.17", "web3": "^4.8.0",' 
  - name: BackendPackages
    value: '"solc": "0.8.17", "web3": "^4.8.0",' 
*/
  {% if element.values.customroute %}
    {{ addExtraFile(element.values.customroute ~ element.values.filename ~ '.sol', element.values.contract) }}
  {% else %}
    {{ addExtraFile('back-end/contracts/' ~ element.values.filename ~ '.sol', element.values.contract) }}
  {% endif %}
  
const compileContract = () => {
  const contractFilePath = `{{element.values.customroute|default('back-end/contracts/')}}{{element.values.filename|raw }}.sol`
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

async function deployContract(bytecode, abi, constructorArgs) {
  const clientAccount = '{{ element.values.senderaddress | default('0xYourClientAddress')}}'
  const clientPrivateKey = '{{ element.values.senderprivatekey | default('YourClientPrivateKey')}}'

  const myContract = new web3.eth.Contract(JSON.parse(abi))
  myContract.handleRevert = true

  const deploy = myContract.deploy({
    data: '0x' + bytecode,
    arguments: constructorArgs
  })

  const gas = await deploy.estimateGas({ from: clientAccount })
	
  try {
    const tx = {
      from: clientAccount,
      data: deploy.encodeABI(),
      gas: web3.utils.toHex(gas),
      gasPrice: await web3.eth.getGasPrice(),
    };

    const signedTx = await web3.eth.accounts.signTransaction(tx, clientPrivateKey);
    const receipt = await web3.eth.sendSignedTransaction(signedTx.rawTransaction);
		
    return {
      contractAddress: receipt.contractAddress,
      abi: abi,
    };
  } catch (error) {
    console.error(error)
  }
}
const compiledContract = compileContract()
const contractDeployment = await deployContract(compiledContract.bytecode, compiledContract.abi, contractArguments);

return contractDeployment;
