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
            if (element.values.name) {
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
  - name: return
    display: Return Value 
    type: text
extraFiles:
  - source: 'elements/Programming/baseHook.tsx'
    destination: 'front-end/hooks/{{ element.values.folderName | default(element.values.name) | friendly }}/{{ element.values.name | friendly }}.tsx'
childs:
  - name:  hookHeader
    element: hookHeader
  - name:  Hook Body
    element: hookBody
*/

{% set hookName = element.values.name %}
{{ add_setting('hookName', hookName) }}

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