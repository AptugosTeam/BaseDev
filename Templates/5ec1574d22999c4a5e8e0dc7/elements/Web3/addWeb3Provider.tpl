/*
path: addWeb3Provider.tpl
keyPath: elements/Web3/addWeb3Provider.tpl
unique_id: s0qTEcEk
options:
  - name: providerDev
    display: Dev HTTP provider
    type: text
    options: ''
  - name: providerProduction
    display: Production HTTP provider
    type: text
    options: ''
  - name: buildForProduction
    display: Build to production?
    type: checkbox
settings:
  - name: Packages
    value: '"web3": "^4.8.0",'
*/
const {Web3} = require('web3')
{% if element.values.buildForProduction %}
  const web3 = new Web3(new Web3.providers.HttpProvider('{{ element.values.providerProduction }}'))
{% else %}
  const web3 = new Web3(new Web3.providers.HttpProvider('{{ element.values.providerDev }}'))
{% endif %}
