/*
path: ImageList.tpl
type: file
unique_id: a0bMX0mi
completePath: elements/Material-UI/ImageList.tpl
icon: ico-field
options:
  - name: variant
    display: Set the variant to use
    type: dropdown
    options: >-
      return [['standard', 'Standard'], ['masonry', 'Masonry'], ['quilted', 'Quilted'], ['woven', 'Woven'],['string', 'String']]
    settings:
      default: 'standard'
  - name: cols
    display: Number of columns
    type: text
    options: ''
    settings:
      default: 2
    required: true
  - name: gap
    display: Gap space
    type: text
    options: ''
    settings:
      default: 4
    required: true
  - name: class
    display: ClassName
    type: styles
    options: ''
children: []
*/
{% set bpr %}
import ImageList from "@mui/material/ImageList";
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<ImageList
{% if element.values.variant %}
  variant='{{ element.values.variant|default("standard") }}'
{% endif %}
{% if element.values.cols %}
  cols={ {{ element.values.cols|default(2) }} }
{% endif %}
{% if element.values.gap %}
  gap={ {{ element.values.gap|default(4) }} }
{% endif %}
{% if element.values.class %}
  className={ {{element.values.class}} }
{% endif %}
>
{{ content | raw }}
</ImageList>