/*
path: useComponent.tpl
keyPath: elements/Programming/useComponent.tpl
unique_id: CGNFDsui
icon: ico-use-component
order: 5
helpText: Renders an existing reusable React component inside the current page or component. Use this when the component already exists and you want to place it in the current layout, optionally passing props.
options:
  - name: name
    display: Component Name
    type: text
    options: ''
    required: true
    helpText: Name of the component to import and render.

  - name: props
    display: Props
    type: text
    options: ''
    helpText: Comma-separated props passed into the component, you must make sure it is build as [propName] colon [propValue] comma  [propName] colon [propValue], etc

  - name: keyprops
    display: Prop Keys
    type: text
    options: ''
    helpText: Optional prop keys used when rendering this component inside lists or repeated structures.

  - name: Utility
    display: Utility Component
    type: checkbox
    options: ''
    helpText: Enable if this component should be imported as a utility/helper component rather than from the standard @components root.

  - name: UtilityOf
    display: Utility Parent Component
    type: text
    options: ''
    advanced: true
    helpText: Optional parent component folder when importing a utility component from inside another component group.

  - name: changePath
    display: Use Parent Relative Path
    type: checkbox
    advanced: true
    helpText: Import the component using ../ComponentName instead of the default @components path.
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
<{{ element.values.name | friendly }} 
  {% if element.values.keyprops %}key={ {{ element.values.keyprops }} }{% endif %}
  {% if element.values.props %}properties={ { {{ element.values.props }} } }{% endif %} 
  {% if not element.children %}/{% endif %}
>
{% if element.children %}
  {{ content | raw }}
</{{ element.values.name | friendly }}>
{% endif %}
