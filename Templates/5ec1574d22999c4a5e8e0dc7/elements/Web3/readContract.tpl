/*
path: readContract.tpl
keyPath: elements/Web3/readContract.tpl
unique_id: xeLoIdbq
options:
  - name: abi
    display: ABI
    type: text
    options: ''
  - name: contractAddress
    display: Contract Address
    type: text
    options: ''
  - name: contractVariableName
    display: Variable Name
    type: text
    settings:
      default: 'contractDeployed'
      active: true
*/
const {{ element.value.contractVariableName | default('contractDeployed') }} = new web3.eth.Contract(JSON.parse({{ element.values.abi }}), {{ element.values.contractAddress }})