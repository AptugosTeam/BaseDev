/*
path: useClass.tpl
keyPath: elements/Programming/useClass.tpl
unique_id: classCGNFDsui
icon: ico-use-component
order: 5
options:
  - name: name
    display: ClasName
    type: text
    options: ''
  - name: props
    display: Props 
    type: variable
  - name: justImportIt
    display: Just Import It
    type: checkbox
    advanced: true
    settings:
      default: false
*/
{% set bpr %}
import {{ element.values.name | friendly }} from '@classes/{{ element.values.name | friendly }}'
{% endset %}
{{ save_delayed('bpr', bpr)}}
{% if not element.values.justImportIt %}
new {{ element.values.name | friendly }}({{ element.values.props }})
{% endif %}