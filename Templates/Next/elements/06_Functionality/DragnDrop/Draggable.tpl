/*
path: Draggable.tpl
type: file
unique_id: drg161tuk
icon: ico-drag-drop
sourceType: javascript
settings:
  - name: Packages
    value: '"react-draggable": "4.4.5",'
options:
  - name: defaultPosition
    display: Default Position
    type: text
    options: ''
  - name: bounds
    display: Bounds
    type: text
    options: ''
  - name: axis
    display: Axis
    type: dropdown
    options: >-
      return [['both', 'Both'], ['x', 'X'], ['y', 'Y'], ['none', 'None']]
    settings:
      default: 'both'
  - name: onDrag
    display: On Drag
    type: text
    options: ''
  - name: onStop
    display: On Stop
    type: text
    options: ''
  - name: scale
    display: Scaling Velocity
    type: text
    options: ''
children: []
*/

{% set bpr %}
import Draggable from "react-draggable";
{% endset %}
{{ save_delayed('bpr', bpr) }}
<Draggable
    {% if element.values.defaultPosition %}
      defaultPosition={ {{ element.values.defaultPosition }} }
    {% endif %}
    {% if element.values.bounds %}
      bounds={ {{ element.values.bounds }} }
    {% endif %}
    {% if element.values.axis != both %} 
      axis={ '{{ element.values.axis | default('both') }}' }
    {% endif %}
    {% if element.values.onDrag %}
      onDrag={ {{ element.values.onDrag }} }
    {% endif %}
    {% if element.values.onStop %}
      onStop={ {{ element.values.onStop }} }
    {% endif %}
    {% if element.values.scale %}
      scale={ {{ element.values.scale }} }
    {% endif %}
>   
    {{ content | raw }}
</Draggable>
