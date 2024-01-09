/*
path: Stepper.tpl
completePath: elements/Experimental/Stepper.tpl
unique_id: UPjrYrt3y
sourceType: javascript
options:
  - name: steps
    display: Steps to be used, you can use an array here
    type: text
  - name: activeStep
    display: Value defining the active step
    type: text
  - name: className
    display: className
    type: styles
    options: ''
  - name: stepClassName
    display: stepClassName
    type: styles
    options: ''
  - name: useSingleStep
    display: Use SingleStep?
    type: checkbox
    settings:
      default: false
    options: ''
  - name: hideConnectors
    display: Hide the step connectors?
    type: checkbox
    settings:
      default: false
    options: ''
  - name: nonLinear
    display: Allow users to enter the flow at any point
    type: checkbox
    settings:
      default: false
    options: ''
  - name: connectorStateColors
    display: Use different colors for connector lines based on adjacent steps state
    type: checkbox
    settings:
      default: false
    options: ''
*/
{% set bpr %}
import { Stepper } from 'react-form-stepper';
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Stepper
    {% if element.values.steps %}
        steps='{{ element.values.steps }}'
    {% endif %}
    {% if element.values.activeStep %}
        activeStep='{{ element.values.activeStep|default('1') }}'
    {% endif %}
    {% if element.values.className %}
        className='{{ element.values.className }}'
    {% endif %}
    {% if element.values.stepClassName %}
        stepClassName='{{ element.values.stepClassName }}'
    {% endif %}
    {% if element.values.stepClassName %}
        stepClassName='{{ element.values.stepClassName }}'
    {% endif %}
    {% if element.values.hideConnectors %}
        hideConnectors={ {{ element.values.hideConnectors|default('false') }} }
    {% endif %}
    {% if element.values.nonLinear %}
        nonLinear={ {{ element.values.nonLinear|default('false') }} }
    {% endif %}
    {% if element.values.connectorStateColors %}
        connectorStateColors={ {{ element.values.connectorStateColors }} }
    {% endif %}
    >
    {% if element.values.useSingleStep %}
        {% for unchild in element.children %}
            <Step>
            {{ unchild.rendered | raw }}
            </Step>
        {% endfor %}
    {% else %}
    {{ content | raw }}
    {% endif %}
</Stepper>