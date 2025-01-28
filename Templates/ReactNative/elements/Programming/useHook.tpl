/*
path: useHook.tpl
keyPath: elements/Programming/useHook.tpl
unique_id: useHook
options:
  - name: name
    display: Hook Name
    type: text
    options: ''
  - name: parameters
    display: Parameters
    type: text
    options: ''
  - name: var
    display: Storage in Variable
    type: text
    options: ''
*/
{% set bpr %}
import { use{{ element.values.name | friendly }} } from '@hooks/{{ element.values.name | friendly }}'
{% endset %}
{{ save_delayed('bpr', bpr)}}

{% if element.values.var %}
{% set ph %}
  const {{ element.values.var }} = use{{ element.values.name | friendly }}({{ element.values.parameters }})
{% endset %}
{{ save_delayed('ph', ph)}}
{% endif %}