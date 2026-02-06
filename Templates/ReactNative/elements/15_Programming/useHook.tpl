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
  - name: withoutUse
    display: Without use
    type: checkbox
*/
{% set bpr %}
import { use{{ element.values.name | friendly }} } from '@hooks/{{ element.values.name | friendly }}'
{% endset %}
{{ save_delayed('bpr', bpr)}}

{% if element.values.var %}
{% set ph %}
  const {{ element.values.var }} = {% if element.values.withoutUse %}{{ element.values.name | friendly }}{% else %}use{{ element.values.name | friendly }}{% endif %}({{ element.values.parameters }})
{% endset %}
{{ save_delayed('ph', ph)}}
{% endif %}