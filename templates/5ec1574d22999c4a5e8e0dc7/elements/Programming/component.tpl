/*
path: component.tpl
keyPath: elements/Programming/component.tpl
unique_id: zHZJ3XKp
usesDelays: [bpr]
delayContext: true
options:
  - name: name
    display: ComponentName
    type: text
    options: ''
    settings:
      aptugoOnLoad: >-
        const element = arguments[0];
        const page = aptugo.pageUtils.findContainerPage(element.unique_id).unique_id;
        if (element.values.name) {
          aptugo.variables.setComponent(element.values.name, `Defined in ${aptugo.plain[page].name}`)
        }
      active: true
  - name: props
    display: Props 
    type: text
  - name: keyprops
    display: Prop Keys (optional) 
    type: text
  - name: useIt
    display: Also use it
    type: checkbox
  - name: interface
    display: Interface (optional) 
    type: text
    advanced: true
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
{% if element.values.useIt %}
{% include includeTemplate('useComponent.tpl') %}
{% endif %}