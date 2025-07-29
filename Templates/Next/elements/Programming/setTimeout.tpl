/*
path: setTimeout.tpl
keyPath: elements/Programming/setTimeout.tpl
unique_id: setTimeout
icon: ico-define-variable
options:
  - name: delay
    display: Delay (ms)
    type: text
    options: ''
*/
setTimeout(() => {
    {{ content | raw }}
}, {{ element.values.delay | default(3000) }})