/*
path: useHook.tpl
keyPath: elements/Programming/useHook.tpl
unique_id: useHook
icon: ico-usehook
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
  - name: UtilityOf
    display: Is an Utility from another component
    type: text
    advanced: true
  - name: withoutUse
    display: Without use
    type: checkbox
*/
{% set bpr %}
  {% if element.values.UtilityOf %}
    import use{{ element.values.name | friendly }} from '@components/{{ element.values.UtilityOf }}/use{{ element.values.name | friendly }}'
  {% else %}
    import {% if not element.values.withoutUse %}use{% endif %}{{ element.values.name | friendly }} from '@hooks/{{ element.values.name | friendly }}'
  {% endif %}
{% endset %}
{{ save_delayed('bpr', bpr)}}
{% if element.values.var %}const {{ element.values.var }} = {% endif %}{% if element.values.withoutUse %}{{ element.values.name | friendly }}{% else %}use{{ element.values.name | friendly }}{% endif %}({{ element.values.parameters }})