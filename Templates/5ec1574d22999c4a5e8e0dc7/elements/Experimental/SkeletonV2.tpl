/*
path: SkeletonV2.tpl
display: Skeleton
type: file
unique_id: skeletonv26
completePath: elements/Experimental/SkeletonV2.tpl
icon: f:Skeleton.svg
helpText: Display a placeholder preview of your content before the data gets loaded to reduce load-time frustration.
children: []
options:
  - name: variant
    display: Variant
    type: dropdown
    options: return [['text', 'Text'], ['rectangular', 'Rectangular'], ['circular', 'Circular']]
    settings:
      default: 'text'
  - name: animation
    display: Animation
    type: dropdown
    options:  return [['pulse', 'Pulse'], ['wave', 'Wave'], ['false', 'False']]
    settings:
      default: 'pulse'
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
    {% if element.values.width %}width={ '{{ element.values.width }}' } {% endif %}
    {% if element.values.height %}height={ '{{ element.values.height }}' } {% endif %}
    {% if element.values.className %}className={ {{ element.values.className }} }{% endif %}
    {% if element.values.bgcolor %}sx={ { bgcolor: '{{ element.values.bgcolor }}' } }{% endif %}
    {% if element.values.extraStyle %}style={ { {{element.values.extraStyle}} } }{% endif %}
/>