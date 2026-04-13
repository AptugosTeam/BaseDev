/*
path: useHook.tpl
keyPath: elements/Programming/useHook.tpl
unique_id: useHook
helpText: Import a custom hook and optionally store its returned value in a local variable
options:
  - name: name
    display: Hook Name
    helpText: Name of the hook to import from the generated hooks folder
    type: text
    options: ''
  - name: parameters
    display: Parameters
    helpText: Argument list passed when the hook is called
    type: text
    options: ''
  - name: var
    display: Storage in Variable
    helpText: Local variable that will receive the hook return value
    type: text
    options: ''
  - name: withoutUse
    display: Without use
    helpText: Call the imported function without prepending use to the hook name
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
