/*
path: setTimeout.tpl
keyPath: elements/Programming/setTimeout.tpl
unique_id: setTimeout
icon: ico-time
options:
  - name: delay
    display: Delay (ms)
    type: text
    options: ''
    settings:
      default: '3000'
      active: true
*/
setTimeout(() => {
  {{ content | raw }}
}, {{ element.values.delay | default(3000) }})