/*
path: hook.tpl
keyPath: elements/Programming/hook.tpl
unique_id: HokApoto
usesDelays: [bpr]
delayContext: true
options:
  - name: name
    display: Hook Name
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
  - name: folderName
    display: Folder name for the hook
    type: text
    options: ''
  - name: parameters
    display: Parameters 
    type: text
extraFiles:
  - source: 'elements/Programming/baseHook.tsx'
    destination: 'src/hooks/{{ element.values.folderName | default(element.values.name) | friendly }}/{{ element.values.name | friendly }}.tsx'
childs:
  - name:  Hook Body
    element: hookBody
*/
{% set hookParameters %}
{{element.values.parameters}}
{% endset %}
{{ add_setting('hookParameters', hookParameters)}}
{% set capturedImportsBPR %}
{% for delay in delayed %}
  {% for specificDelay in delay.bpr %}
    {{ specificDelay }}
  {% endfor %}
{% endfor %}
{% endset %}
{{ add_setting('capturedImportsBPR', capturedImportsBPR)}}