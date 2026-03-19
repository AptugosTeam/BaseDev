/*
path: component.tpl
keyPath: elements/Programming/component.tpl
unique_id: zHZJ3Xpo
usesDelays: [bpr]
delayContext: true
icon: ico-component
order: 4
helpText: Defines a reusable React component and optionally renders it in the current page. Use this when you want to extract a reusable UI block into src/components and keep its internal structure inside componentHeader and componentBody.
options:
  - name: name
    display: Component Name
    type: text
    options: ''
    required: true
    helpText: Name of the React component to generate.
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
    type: text
    options: ''
    helpText: Comma-separated component props definition, for example title, subtitle, onClick

  - name: keyprops
    display: Prop Keys
    type: text
    options: ''
    helpText: Optional comma-separated prop keys used for mapping or stable keys when rendering repeatedly.

  - name: useIt
    display: Render It Here
    type: checkbox
    options: ''
    helpText: If enabled, the generated component will also be used at the current location.

  - name: subcomponent
    display: Parent Component Group
    type: text
    options: ''
    helpText: Optional folder/group name for organizing this component under src/components. If omitted, the component name is used.
extraFiles:
  - source: 'elements/99_ExtraFiles/baseComponent.tsx'
    destination: 'src/components/{{ element.values.subcomponent|default(element.values.name) | friendly }}/{{ element.values.name | friendly }}.tsx'
childs:
  - name: Component Header
    element: componentHeader
  - name: Component Body
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