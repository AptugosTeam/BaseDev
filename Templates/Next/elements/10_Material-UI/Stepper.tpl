/*
path: Stepper.tpl
completePath: elements/Experimental/Stepper.tpl
unique_id: UPjrYrt3y
sourceType: javascript
options:
  - name: activeStep
    display: Value defining the active step
    type: text
  - name: className
    display: className
    type: styles
    options: ''
  - name: linear?
    display: Determines wether you can advance if the step isnt finished or not
    type: checkbox
    settings:
      default: false
    options: ''
  - name: alternativeLabel?
    display: If set to 'true' and orientation is horizontal, then the step label will be positioned under the icon.
    type: checkbox
    settings:
      default: false
    options: ''
  - name: orientation
    display: Stepper orientation
    type: dropdown
    options: horizontal;vertical
*/
{% set bpr %}
import Stepper from '@mui/material/Stepper';
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Stepper
    {% if element.values.activeStep %}
        activeStep='{{ element.values.activeStep|default('1') }}'
    {% endif %}
    {% if element.values.className %}
        className='{{ element.values.className }}'
    {% endif %}
    {% if element.values.linear %}
        linear={ {{ element.values.linear|default('false') }} }
    {% endif %}
    {% if element.values.alternativeLabel %}
        alternativeLabel={ {{ element.values.alternativeLabel }} }
    {% endif %}
    {% if element.values.orientation %}
        orientation={ {{ element.values.orientation }} }
    {% endif %}
    >
    {{ content | raw }}
</Stepper>