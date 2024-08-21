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
    {{ addExtraFile('back-end/' ~ element.values.customroute ~ element.values.filename ~ '.sol', element.values.contract) }}
  {% else %}
    {{ addExtraFile('back-end/contracts/' ~ element.values.filename ~ '.sol', element.values.contract) }}
  {% endif %}
  
const compileContract = () => {
  const fs = require ('fs')
  const solc = require('solc')
  const contractFilePath = `${__dirname}/{{element.values.customroute|default('contracts')}}/{{element.values.filename|raw }}.sol`
  const fileName = '{{ element.values.filename }}'
  const contractName = '{{ element.values.filename }}'
  try {
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

    const compiledCode = JSON.parse(solc.compile(JSON.stringify(input)))
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

async function deployContract(bytecode, abi, constructorArgs) {
  const clientAccount = '{{ element.values.senderaddress | default('0xYourClientAddress')}}'
  const clientPrivateKey = '{{ element.values.senderprivatekey | default('YourClientPrivateKey')}}'

  try {
    const myContract = new web3.eth.Contract(JSON.parse(abi))
    myContract.handleRevert = true

    const deploy = myContract.deploy({
      data: '0x' + bytecode,
      arguments: constructorArgs
    })

    const gas = await deploy.estimateGas({ from: clientAccount })
	

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
    }
  } catch (error) {
    console.error('Error deploying contract:', error)
    throw new Error('Contract deployment failed.')
  }
}

try {
  const compiledContract = compileContract()
  const contractDeployment = await deployContract(compiledContract.bytecode, compiledContract.abi, {{ element.values.arguments }});
  
  console.log('********* contract created *********', contractDeployment.contractAddress)

  return contractDeployment;
} catch (error) {
    console.error('Error in CreateContract:', error)
    throw error
}
