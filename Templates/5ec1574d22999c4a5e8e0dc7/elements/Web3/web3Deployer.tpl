/*
path: web3Deployer.tpl
keyPath: elements/Web3/web3Deployer.tpl
unique_id: XWvJ2lvu
*/

const deployContract = async (
  bytecode = '', 
  abi = '', 
  constructorArgs = [], 
  deployer = { address: '', pk: ''}, 
  gasData = { maxPriorityFee: null, maxFee: null }
) => {
  const { address, pk } = deployer
  const { maxPriorityFee, maxFee } = gasData

  try {
    if(!address) throw new Error('Deployer address is required')
    if(!pk) throw new Error('Deployer private key is required')

    if (!maxPriorityFee || !maxFee) {
      throw new Error('Gas data must include maxPriorityFee and maxFee.');
    }

    const myContract = new web3.eth.Contract(JSON.parse(abi))
    myContract.handleRevert = true

    const deploy = myContract.deploy({
      data: '0x' + bytecode,
      arguments: constructorArgs
    })

    const nonce = await web3.eth.getTransactionCount(address, 'pending');
    const estimatedGas = await deploy.estimateGas({ from: address, nonce })
	
    const tx = {
      from: address,
      data: deploy.encodeABI(),
      nonce: web3.utils.toHex(nonce),
      gas: web3.utils.toHex(Math.ceil(Number(estimatedGas) * 1.2)),
      maxFeePerGas: web3.utils.toWei(maxFee.toString(), 'gwei'),
      maxPriorityFeePerGas: web3.utils.toWei(maxPriorityFee.toString(), 'gwei'),
    };

    const signedTx = await web3.eth.accounts.signTransaction(tx, pk);
    const { contractAddress } = await web3.eth.sendSignedTransaction(signedTx.rawTransaction);
		
    return {
      contractAddress,
      abi,
    }
  } catch (error) {
    console.error('Error deploying contract:', error.message || error)
    throw new Error('Contract deployment failed.')
  }
}