/*
path: CreateWatchForKeys.tpl
display: Watch for keystrokes
keyPath: elements/Games/CreateWatchForKeys.tpl
unique_id: qloTP0ae
icon: ico-keyboard
options:
  - name: keys
    display: Keys to Capture
    type: text
    options: ''
  - name: variableName
    display: Variable Name
    type: text
    advanced: true
    settings:
      default: 'keys'
*/
{% set variableDeclarations %}
{{ element.values.variableName|default('keys')}}:any
{% endset %}
{{ save_delayed('variableDeclarations', variableDeclarations) }}
this.{{ element.values.variableName|default('keys')}} = this.input.keyboard.addKeys('{{ element.values.keys }}')