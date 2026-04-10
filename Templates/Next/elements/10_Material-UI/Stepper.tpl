/*
path: Stepper.tpl
completePath: elements/Experimental/Stepper.tpl
unique_id: UPjrYrt3y
sourceType: javascript
options:
  - name: activeStep
    display: Active step index
    type: text
  - name: className
    display: className
    type: styles
    options: ''
  - name: linear?
    display: Enforce linear flow
    type: checkbox
    settings:
      default: false
    options: ''
  - name: alternativeLabel?
    display: If true and orientation is horizontal, the label is rendered below the icon
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
{{ save_delayed('bpr', bpr) }}
<Stepper
    {% if element.values.activeStep is defined and element.values.activeStep != '' %}
        activeStep={ {{ element.values.activeStep|default('0') }} }
    {% endif %}
    {% if element.values.className %}
        className={ {{ element.values.className }} }
    {% endif %}
    {% if element.values['linear?'] is defined and element.values['linear?'] %}
        nonLinear={ false }
    {% endif %}
    {% if element.values['linear?'] is defined and not element.values['linear?'] %}
        nonLinear={ true }
    {% endif %}
    {% if element.values['alternativeLabel?'] is defined and element.values['alternativeLabel?'] %}
        alternativeLabel={ true }
    {% endif %}
    {% if element.values.orientation %}
        orientation="{{ element.values.orientation|default('horizontal') }}"
    {% endif %}
>
    {{ content | raw }}
</Stepper>