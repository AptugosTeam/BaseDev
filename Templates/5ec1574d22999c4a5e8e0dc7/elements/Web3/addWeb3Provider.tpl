/*
path: addWeb3Provider.tpl
keyPath: elements/Web3/addWeb3Provider.tpl
unique_id: s0qTEcEk
options:
  - name: provider
    display: Provider
    type: text
    options: ''
settings:
  - name: Packages
    value: '"web3": "^4.8.0",'
*/
const {Web3} = require('web3')
const web3 = new Web3(new Web3.providers.HttpProvider('{{ element.values.provider }}'))