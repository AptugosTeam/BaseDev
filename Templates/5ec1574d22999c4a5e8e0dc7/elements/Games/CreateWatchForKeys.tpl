/*
path: CreateWatchForKeys.tpl
keyPath: elements/Games/CreateWatchForKeys.tpl
unique_id: qloTP0ae
icon: f:keyboard_hide.svg
options:
  - name: keys
    display: Keys to Capture
    type: text
    options: ''
*/
this.input.keyboard.addKeys('{{ element.values.keys }}')