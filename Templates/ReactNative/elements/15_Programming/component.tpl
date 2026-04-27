/*
path: component.tpl
keyPath: elements/Programming/component.tpl
unique_id: zHZJ3Xpo
usesDelays: [bpr,ph]
delayContext: true
icon: ico-component
helpText: Define a reusable React Native component in its own generated file and optionally render it from the current screen
order: 4
options:
  - name: name
    display: ComponentName
    helpText: Component name used for the generated file, export, and optional usage element
    type: text
    options: ''
    settings:
      aptugoOnLoad: >-
        const element = arguments[0];
        const page = aptugo.pageUtils.findContainerPage(element.unique_id);
        if (element.values.name) {
          aptugo.variables.setComponent(element.values.name, `Defined in ${page.name}`);
        }
      active: true
  - name: props
    display: Props 
    helpText: Component parameter list or props signature used by the generated component template
    type: text
  - name: keyprops
    display: Prop Keys (optional) 
    helpText: Optional prop key list used by the component template when generating helper logic
    type: text
  - name: useIt
    display: Also use it
    helpText: When enabled, Aptugo also inserts a matching useComponent element to render the new component
    type: checkbox
  - name: subcomponent
    display: It is a utility of...
    helpText: Parent component folder used when this component should be generated as a utility or nested component
    type: text
  - name: interface
    display: Interface
    type: text
    advanced: true
extraFiles:
  - source: 'elements/99_ExtraFiles/baseComponent.tsx'
    destination: 'front-end/components/{{ element.values.subcomponent|default(element.values.name) | friendly }}/{{ element.values.name | friendly }}.tsx'
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
