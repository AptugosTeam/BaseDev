/*
path: class.tpl
keyPath: elements/Programming/class.tpl
unique_id: classzHZJ3Xpo
holder: true
usesDelays: [bpr,variableDeclarations]
delayContext: true
icon: ico-component
order: 4
options:
  - name: name
    display: Class Name
    type: text
    options: ''
    settings:
      aptugoOnLoad: >-
        const element = arguments[0];
        const page = aptugo.pageUtils.findContainerPage(element.unique_id);
        if (element.values.name) {
          aptugo.variables.setVariable({ name: element.values.name, desc: `Defined in ${page.name}`, type: 'Class', unique_id: element.unique_id });
        }
      active: true
  - name: props
    display: Constructor Props 
    type: text
  - name: extends
    display: Extends another class
    type: text
    advanced: true
extraFiles:
  - source: 'elements/99_ExtraFiles/baseClass.tsx'
    destination: 'src/classes/{{ element.values.name | friendly }}.tsx'
childs:
  - name:  classConstructor
    element: function
    values: {
      functionName: 'constructor'
    }
*/
{% set capturedImportsBPR %}
{% for delay in delayed %}
  {% for specificDelay in delay.bpr %}
    {{ specificDelay }}
  {% endfor %}
{% endfor %}
{% endset %}
{{ add_setting('capturedImportsBPR', capturedImportsBPR)}}