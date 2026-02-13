/*
path: createAccount.tpl
keyPath: elements/Web3/createAccount.tpl
unique_id: GhJxlsTe
options:
  - name: varName
    display: Variable Name
    type: text
    options: ''
    settings:
      default: 'account'
      active: true
*/
const {{ element.values.varName|default('account')}} = web3.eth.accounts.create()
