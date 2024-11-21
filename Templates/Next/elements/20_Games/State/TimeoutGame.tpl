/*
path: TimeoutGame.tpl
keyPath: elements/Games/State/TimeoutGame.tpl
unique_id: IcPG22JL
icon: ico-time
options:
  - name: valuesTimes
    display: Times to set
    type: text
*/
setTimeout(() => {
  {{content | raw }}
}, {{element.values.valuesTimes}});