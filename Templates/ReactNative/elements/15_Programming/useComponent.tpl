/*
path: useComponent.tpl
keyPath: elements/Programming/useComponent.tpl
unique_id: CGNFDsCQ
helpText: Import a generated component and render it with optional props and child content
options:
  - name: name
    display: ComponentName
    helpText: Name of the generated component to import and render
    type: text
    options: ''
  - name: props
    display: Props 
    helpText: Object content passed into the rendered component as properties
    type: code
  - name: keyprops
    display: Prop Keys (optional) 
    helpText: Optional prop key list used by the template when generating component usage helpers
    type: text
  - name: Utility
    display: Utility Component
    helpText: Import the component as a utility component from the local or nested component folder
    type: checkbox
  - name: UtilityOf
    display: Is an Utility from another component
    helpText: Parent component folder used when importing a nested utility component
    type: text
    advanced: true
  - name: changePath
    display: Change Path (optional) 
    helpText: Import the component from a parent relative path instead of the default components folder
    type: checkbox
    advanced: true
    settings: 
      default: false
*/
{% set bpr %}
{% if element.values.Utility %}
  {% if element.values.UtilityOf %}
    import {{ element.values.name | friendly }} from '@components/{{ element.values.UtilityOf }}/{{ element.values.name | friendly }}'
  {% else %}
    import {{ element.values.name | friendly }} from './{{ element.values.name | friendly }}'
  {% endif %}
{% elseif element.values.changePath %}
import {{ element.values.name | friendly }} from '../{{ element.values.name | friendly }}'
{% else %}
import {{ element.values.name | friendly }} from '@components/{{ element.values.name | friendly }}/{{ element.values.name | friendly }}'
{% endif %}
{% endset %}
{{ save_delayed('bpr', bpr)}}
<{{ element.values.name | friendly }} {% if element.values.props %}properties={ { {{ element.values.props }} } }{% endif %} {% if not element.children %}/{% endif %}>
{% if element.children %} {{ content | raw }}</{{ element.values.name | friendly }}>{% endif %}
