/*
path: useComponent.tpl
keyPath: elements/Programming/useComponent.tpl
unique_id: CGNFDsui
icon: ico-use-component
order: 5
options:
  - name: name
    display: ComponentName
    type: text
    options: ''
  - name: props
    display: Props 
    type: text
  - name: keyprops
    display: Prop Keys (optional) 
    type: text
*/
{% set bpr %}
import {{ element.values.name | friendly }} from '@components/{{ element.values.name | friendly }}/{{ element.values.name | friendly }}'
{% endset %}
{{ save_delayed('bpr', bpr)}}
<{{ element.values.name | friendly }} {% if element.values.props %}properties={ { {{ element.values.props }} } }{% endif %} {% if not element.children %}/{% endif %}>
{% if element.children %} {{ content | raw }}</{{ element.values.name | friendly }}>{% endif %}