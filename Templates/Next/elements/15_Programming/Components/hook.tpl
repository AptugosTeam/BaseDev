/*
path: hook.tpl
keyPath: elements/Programming/hook.tpl
unique_id: HokApoto
usesDelays: [bpr,ph]
delayContext: true
icon: ico-hook
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
  - name: subcomponent
    display: It is a utility of...
    type: text
extraFiles:
  - source: 'elements/99_ExtraFiles/baseHook.tsx'
    destination: '{% if element.values.subcomponent %}src/components/{{ element.values.subcomponent }}/use{{ element.values.name}}.tsx{% else %}src/hooks/{{ element.values.folderName | default(element.values.name) | friendly }}/index.tsx{% endif %}'
childs:
  - name:  hookHeader
    element: hookHeader
  - name:  Hook Body
    element: hookBody
*/
{% set capturedImportsBPR %}
{% for delay in delayed %}
  {% for specificDelay in delay.bpr %}
    {{ specificDelay }}
  {% endfor %}
{% endfor %}
{% endset %}
{{ add_setting('capturedImportsBPR', capturedImportsBPR)}}