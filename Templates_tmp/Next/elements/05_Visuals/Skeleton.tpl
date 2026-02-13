/*
path: Skeleton.tpl
type: file
unique_id: skeleton666
icon: ico-skeleton
helpText: Display a placeholder preview of your content before the data gets loaded to reduce load-time frustration.
children: []
options:
  - name: variant
    display: Variant
    type: dropdown
    options: text;rectangular;circular 
    settings:
      default: text
  - name: animation
    display: Animation
    type: dropdown
    options: pulse;wave;false 
    settings:
      default: pulse
  - name: width
    display: Width
    type: text
    options: ''
  - name: height
    display: Height
    type: text
    options: ''
  - name: bgcolor
    display: Background Color
    type: text
    options: ''
  - name: className
    display: ClassName
    type: styles
    options: ''
  - name: extraStyle
    display: Extra Styles
    type: text
    options: ''    
*/

{% set bpr %}
import Skeleton from '@mui/material/Skeleton'
{% endset %}
{{ save_delayed('bpr',bpr) }}

<Skeleton
    {% if element.values.variant %}variant='{{ element.values.variant }}'{% endif %}
    {% if element.values.animation %}animation='{{ element.values.animation }}'{% endif %}
    {% if element.values.width %}width='{{ element.values.width }}px'{% endif %}
    {% if element.values.height %}height={ {{ element.values.height }} } {% endif %}
    {% if element.values.className %}className={ {{ element.values.className }} }{% endif %}
    {% if element.values.bgcolor %}sx={ { bgcolor: '{{ element.values.bgcolor }}' } }{% endif %}
    {% if element.values.extraStyle %}style={ { {{element.values.extraStyle}} } }{% endif %}
/>