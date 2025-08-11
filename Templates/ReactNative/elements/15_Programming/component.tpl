/*
path: component.tpl
keyPath: elements/Programming/component.tpl
unique_id: zHZJ3XKp
usesDelays: [bpr,ph]
delayContext: true
options:
  - name: name
    display: Component Name
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
  - name: folder
    display: Folder (optional)
    type: text
    options: ''
  - name: filename
    display: Filename (optional)
    type: text
    options: ''
  - name: props
    display: Props 
    type: text
  - name: keyprops
    display: Prop Keys (optional) 
    type: text
  - name: useIt
    display: Also use it
    type: checkbox
  - name: useForwardRef
    display: Use ForwardRef
    type: checkbox
    settings:
      default: false
extraFiles:
  - source: 'elements/15_Programming/baseComponent.tsx'
    destination: >-
      front-end/components/{% if element.values.folder %}{{ element.values.folder }}{% else %}{{ element.values.name | friendly }}{% endif %}/{% if element.values.filename %}{{ element.values.filename }}{% else %}index.tsx{% endif %}
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