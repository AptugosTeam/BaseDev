/*
path: web3Contract.tpl
keyPath: elements/Web3/web3Contract.tpl
unique_id: NQcF1kcy
options:
  - name: filename
    display: Filename (without extension)
    type: text  
  - name: contract
    display: Contract (SOL)
    type: code
    options: ''
  - name: customStorePath
    display: Store File Path
    type: text
    advanced: true
settings:
  - name: Packages
    value: '"solc": "0.8.17", "web3": "^4.8.0",' 
  - name: BackendPackages
    value: '"solc": "0.8.17", "web3": "^4.8.0", "@openzeppelin/contracts": "^4.9.3",'
*/

{% if element.values.customroute %}
  {{ addExtraFile('back-end/' ~ element.values.customroute ~ element.values.filename ~ '.sol', element.values.contract) }}
{% else %}
  {{ addExtraFile('back-end/contracts/' ~ element.values.filename ~ '.sol', element.values.contract) }}
{% endif %}