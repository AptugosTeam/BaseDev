/*
path: CreateWatchForKeys.tpl
display: Watch for keystrokes
keyPath: elements/Games/CreateWatchForKeys.tpl
unique_id: qloTP0ae
icon: ico-keyboard
options:
  - name: variableName
    display: Variable Name
    type: text
    settings:
      default: 'keys'
  - name: cursors
    display: Capture Cursor Keys
    type: checkbox
  - name: keys
    display: Keys to Capture
    type: text
    options: ''
    settings:
      propertyCondition: cursors
      condition: false
*/
{% set variableDeclarations %}
{{ element.values.variableName|default('keys')}}:any
{% endset %}{{ save_delayed('variableDeclarations', variableDeclarations) }}
this.{{ element.values.variableName|default('keys')}} = this.input.keyboard.{% if element.values.cursors %}createCursorKeys(){% else %}addKeys({{ element.values.keys | textOrVariable }}){% endif %}