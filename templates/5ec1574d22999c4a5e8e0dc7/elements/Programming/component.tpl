/*
path: component.tpl
keyPath: elements/Programming/component.tpl
unique_id: zHZJ3XKp
usesDelays: [bpr]
options:
  - name: name
    display: ComponentName
    type: text
    options: ''
  - name: props
    display: Props 
    type: text
  - name: keyprops
    display: Prop Keys (optional) 
    type: text
extraFiles:
  - source: 'elements/Programming/baseComponent.tsx'
    destination: 'front-end/components/{{ element.values.name | friendly }}/index.tsx'
childs:
  - name:  componentHeader
    element: componentHeader
  - name:  componentBody
    element: componentBody
*/
{% set capturedImportsBPR %}
{% for delay in delayed %}
  {% for specificDelay in delay.bpr %}
    {{ specificDelay }}
  {% endfor %}
{% endfor %}
{% endset %}
{{ add_setting('capturedImportsBPR', capturedImportsBPR)}}
{% include includeTemplate('useComponent.tpl') %}