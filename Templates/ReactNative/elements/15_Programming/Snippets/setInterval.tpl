/*
path: setInterval.tpl
keyPath: elements/Programming/setInterval.tpl
unique_id: setInterval
icon: ico-time
options:
  - name: interval
    display: Interval (ms)
    type: text
    options: ''
    settings:
      default: '1000'
      active: true
  - name: variableName
    display: Variable Name
    type: text
    options: ''
  - name: variableType
    display: Variable Type
    type: dropdown
    options: const;let;var
    settings:
      default: const
*/
{% if element.values.variableName %}{{ element.values.variableType | default('const') }} {{ element.values.variableName }} = {% endif %}setInterval(() => {
  {{ content | raw }}
}, {{ element.values.interval | default(1000) }})
