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
    type: text
  - name: keyprops
    display: Prop Keys (optional) 
    type: text
  - name: useContext
    display: Use as Context
    type: checkbox
    advanced: true
*/
{% set bpr %}
import {{ element.values.name | friendly }} from '@components/{{ element.values.name | friendly }}'
{% endset %}
{% if not element.values.useContext %}
{{ save_delayed('bpr', bpr)}}
{% else %}
{{ add_setting('SiteWideBeforePageRenderAddenum', bpr) }}
{% endif %}
{% if not element.values.useContext %}
<{{ element.values.name | friendly }} {% if element.values.props %}properties={ { {{ element.values.props }} } }{% endif %}/>
{% else %}
{% set contextStart %}
<{{ element.values.name | friendly }} {% if element.values.props %}properties={ { {{ element.values.props }} } }{% endif %}>
{% endset %}
{% set contextEnd %}
</{{ element.values.name | friendly }}>
{% endset %}
{{ add_setting('SiteWideWrapStart', contextStart) }}
{{ add_setting('SiteWideWrapEnd', contextEnd) }}
{% endif %}