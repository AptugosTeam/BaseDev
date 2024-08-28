/*
path: useComponent.tpl
keyPath: elements/Programming/useComponent.tpl
unique_id: CGNFDsui
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
  - name: renderChilds
    display: Render Childrens?
    type: checkbox
    settings:
      default: false
*/
{% set bpr %}
import {{ element.values.name | friendly }} from '@components/{{ element.values.name | friendly }}/{{ element.values.name | friendly }}'
{% endset %}
{{ save_delayed('bpr', bpr)}}
{% if not element.values.renderChilds %}
<{{ element.values.name | friendly }} {% if element.values.props %}properties={ { {{ element.values.props }} } }{% endif %}/>
{% else %}
<{{ element.values.name | friendly }} {% if element.values.props %}properties={ { {{ element.values.props }} } }{% endif %}>
{{ content | raw }}
</{{ element.values.name | friendly }}>
{% endif %}