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
  - name: color
    display: Color
    type: dropdown
    options: 
      return [['default', 'Default'],['primary', 'Primary'],['secondary', 'Secondary'],['error', 'Error'],['warning', 'Warning'],['info', 'Info'],['success', 'Success'],['action', 'Action'],['disabled', 'Disabled']]
  - name: className
    display: className
    type: styles
  - name: fontSize
    display: Size (rem, em, px)
    type: text
*/
{% set bpr %}
import { {{ element.values.icon|default('HelpOutline') }} } from '@mui/icons-material';
{% endset %}
{{ save_delayed('bpr',bpr) }}
<{{ element.values.icon|default('HelpOutline') }} 
    {% if element.values.color %}
      color="{{ element.values.color }}"
    {% endif %} 
    {% if element.values.className %}
      className={{ element.values.className|textOrVariable }}
    {% endif %}
      sx={ {
        {% if element.values.fontSize %}
          fontSize: {{ element.values.fontSize }}
        {% endif %}
        } }
  />