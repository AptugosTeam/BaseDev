/*
path: Step.tpl
completePath: elements/Experimental/Step.tpl
unique_id: UPjnuRt3y
sourceType: javascript
options:
  - name: label
    display: Value to be displayed under each step
    type: text
  - name: active
    display: Value to indicate should the step be displayed as active
    type: checkbox
    settings:
      default: true
    options: ''
  - name: completed
    display: Value to indicate should the step be displayed as completed
    type: checkbox
    settings:
      default: false
    options: ''
  - name: index
    display: Index value of the step
    type: text
  - name: className
    display: className
    type: styles
    options: ''
*/
{% set bpr %}
import { Stepper } from 'react-form-stepper';
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Step
    {% if element.values.label %}
        label='{{ element.values.label }}'
    {% endif %}
    {% if element.values.index %}
        index='{{ element.values.index }}'
    {% endif %}
    {% if element.values.className %}
      className={ {{ element.values.className }} }
    {% endif %}
    {% if element.values.active %}
        active={ {{ element.values.active }} }
    {% endif %}
    {% if element.values.completed %}
        completed={ {{ element.values.completed }} }
    {% endif %}
    {% if element.values.open %}
        open={ {{ element.values.open|default('true') }} }
    {% endif %}
    >
{{ content | raw }}
<Step/>