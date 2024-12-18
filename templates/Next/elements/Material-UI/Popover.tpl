/*
path: Popover.tpl
type: file
unique_id: jfYgdlSm
icon: ico-box
sourceType: javascript
options:
  - name: anchorEl
    display: Anchor Element (State Variable)
    type: text
    options: ''
  - name: className
    display: ClassName
    type: styles
    options: ''
  - name: anchorVer
    display: Anchor Origin Vertical
    type: dropdown
    options: >-
      return [['top', 'Top'],['center', 'Center'],['bottom', 'Bottom']]
    settings:
      default: top  
  - name: anchorHor
    display: Anchor Origin Horizontal
    type: dropdown
    options: >-
      return [['left', 'Left'],['center', 'Center'],['right', 'Right']]
    settings:
      default: left  
  - name: transformOriginVer
    display: Transform Origin Vertical
    type: dropdown
    options: >-
      return [['top', 'Top'],['center', 'Center'],['bottom', 'Bottom']]
    settings:
      default: top  
  - name: transformOriginHor
    display: Transform Origin Horizontal
    type: dropdown
    options: >-
      return [['left', 'Left'],['center', 'Center'],['right', 'Right']]
    settings:
      default: left  
children: []
*/

{% set bpr %}
import Popover from "@mui/material/Popover";
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<Popover 
    {% if element.values.className %} className={ {{ element.values.className }} } {% endif %} 
    open={Boolean( {{ element.values.anchorEl | default(false) }} )}
     {% if element.values.anchorEl %}
      anchorEl={ {{ element.values.anchorEl | default(true) }} } 
       onClose={ () => { set{{ element.values.anchorEl }}(null) } }
      {% endif %} 
    {% if element.values.anchorVer or element.values.anchorHor %}
    anchorOrigin={ {
        vertical: "{{ element.values.anchorVer | default(top) }}",
        horizontal: "{{ element.values.anchorHor | default(left) }}",
    } }
    {% endif %} 
    {% if element.values.transformOriginVer or element.values.transformOriginHor %}
    transformOrigin={ {
        vertical: "{{ element.values.transformOriginVer | default(top) }}",
        horizontal: "{{ element.values.transformOriginHor | default(left) }}",
    } }
    {% endif %} 
>
  {{ content | raw }}
</Popover>