/*
path: MaterialIcon.tpl
type: file
unique_id: RhqkoHE4
icon: f:MaterialIcon.svg
helpText: Shows a material icon from the list
children: []
options:
  - name: icon
    display: Icon
    type: text
    options: Access
    required: true
  - name: color
    display: Color
    type: dropdown
    options: 
      return [['primary', 'Primary'],['secondary', 'Secondary'],['error', 'Error'],['warning', 'Warning'],['info', 'Info'],['success', 'Success'],['action', 'Action'],['disabled', 'Disabled'],['custom', 'Custom']]
  - name: custom
    display: Custom Color
    type: text
    settings:
      propertyCondition: color
      condition: custom
      active: true
  - name: className
    display: className
    type: styles
  - name: fontSize
    display: Size (rem, em, px)
    type: text
  - name: viewBox
    display: viewBox size
    type: text
    advanced: true
*/
{% set bpr %}
import { {{ element.values.icon|default('HelpOutline') }} } from '@mui/icons-material';
{% endset %}
{{ save_delayed('bpr',bpr) }}
<{{ element.values.icon|default('HelpOutline') }}
  {% if element.values.color != 'custom' %}
    color="{{ element.values.color|default('inherit') }}"
  {% endif %}
  {% if element.values.className %}
    className={ {{ element.values.className }} }
  {% endif %}
  {% if element.values.viewBox %}
    viewBox=" {{ element.values.viewBox }} "
  {% endif %}
  sx={ {
    {% if element.values.fontSize %}fontSize: {{ element.values.fontSize }},{% endif %}
    {% if element.values.color == 'custom' %}color: "{{ element.values.custom }}"{% endif %}
  } }
/>