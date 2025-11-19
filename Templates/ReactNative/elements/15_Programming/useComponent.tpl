/*
path: useComponent.tpl
keyPath: elements/Programming/useComponent.tpl
unique_id: CGNFDsCQ
options:
  - name: name
    display: ComponentName
    type: text
    options: ''
  - name: props
    display: Props 
    type: code
  - name: keyprops
    display: Prop Keys (optional) 
    type: text
  - name: Utility
    display: Utility Component
    type: checkbox
  - name: changePath
    display: Change Path (optional) 
    type: checkbox
    advanced: true
    settings: 
      default: false
*/
{% set bpr %}
{% if element.values.Utility %}
  import {{ element.values.name | friendly }} from './{{ element.values.name | friendly }}'
{% elseif element.values.changePath %}
import {{ element.values.name | friendly }} from '../{{ element.values.name | friendly }}'
{% else %}
import {{ element.values.name | friendly }} from '@components/{{ element.values.name | friendly }}/{{ element.values.name | friendly }}'
{% endif %}
{% endset %}
{{ save_delayed('bpr', bpr)}}
<{{ element.values.name | friendly }} {% if element.values.props %}properties={ { {{ element.values.props }} } }{% endif %} {% if not element.children %}/{% endif %}>
{% if element.children %} {{ content | raw }}</{{ element.values.name | friendly }}>{% endif %}