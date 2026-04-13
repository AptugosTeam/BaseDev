/*
path: hook.tpl
keyPath: elements/Programming/hook.tpl
unique_id: HokApoto
usesDelays: [bpr,ph]
delayContext: true
helpText: Define a reusable custom React hook in its own generated file
options:
  - name: name
    display: Hook Name
    helpText: Hook name used for the generated file and exported hook function
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
    helpText: Optional output folder name for the generated hook file
    type: text
    options: ''
  - name: parameters
    display: Parameters 
    helpText: Parameter list used in the hook signature
    type: text
  - name: return
    display: Return Value 
    helpText: Descriptive return metadata for the hook editor or generator context
    type: text
extraFiles:
  - source: 'elements/15_Programming/baseHook.tsx'
    destination: 'front-end/hooks/{{ element.values.folderName | default(element.values.name) | friendly }}/index.tsx'
childs:
  - name:  hookHeader
    element: hookHeader
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
