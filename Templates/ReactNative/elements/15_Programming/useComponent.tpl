/*
path: useComponent.tpl
keyPath: elements/Programming/useComponent.tpl
unique_id: CGNFDsCQ
options:
  - name: name
    display: ComponentName
    type: text
    options: ''
  - name: importPath
    display: Import Path (optional, overrides default)
    type: text
    advanced: true
    options: ''
  - name: props
    display: Props 
    type: text
  - name: keyprops
    display: Prop Keys (outside properties)
    type: text
  - name: changePath
    display: Change Path (optional) 
    type: checkbox
    advanced: true
    settings: 
      default: false
*/
{% set bpr %}
{% if element.values.importPath %}
import {{ element.values.name | friendly }} from '{{ element.values.importPath }}'
{% elseif element.values.changePath %}
import {{ element.values.name | friendly }} from '../{{ element.values.name | friendly }}'
{% else %}
import {{ element.values.name | friendly }} from '@components/{{ element.values.name | friendly }}'
{% endif %}
{% endset %}
{{ save_delayed('bpr', bpr)}}
<{{ element.values.name | friendly }}
  {% if element.values.props %}properties={ { {{ element.values.props }} } }{% endif %}
  {% if element.values.keyprops %}{{ element.values.keyprops }}{% endif %}
/>