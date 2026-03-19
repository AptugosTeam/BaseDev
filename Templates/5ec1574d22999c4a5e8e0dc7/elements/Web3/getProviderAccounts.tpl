/*
path: getProviderAccounts.tpl
keyPath: elements/Web3/getProviderAccounts.tpl
unique_id: 79cpehKt
options:
  - name: variableName
    display: VariableName
    type: text
    options: ''
*/
web3.eth.getAccounts().then({{ element.values.variableName }} => {
  {{ content|raw }}
})
