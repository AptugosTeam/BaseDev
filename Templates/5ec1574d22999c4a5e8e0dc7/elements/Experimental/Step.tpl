/*
path: Step.tpl
completePath: elements/Experimental/Step.tpl
unique_id: UPjnuRt3y
sourceType: javascript
options:
  - name: className
    display: ClassName
    type: styles
    options: ''
  - name: active
    display: Value to indicate should the step be displayed as active
    type: text
    options: ''
  - name: completed
    display: Value to indicate should the step be displayed as completed
    type: checkbox
    settings:
      default: false
    options: ''
  - name: optional
    display: Optional label
    type: text
    options: ''
  - name: label
    display: Step label
    type: text
    options: ''
  - name: error
    display: Error
    type: text
    options: ''
  - name: disabled
    display: If true, the step is disabled, will also disable the button if StepButton is a child of Step
    type: checkbox
    settings:
      default: false
    options: ''
  - name: expanded
    display: Step expanded?
    type: checkbox
    settings:
      default: false
    options: ''
  - name: last
    display: Last step?
    type: checkbox
    settings:
      default: false
    options: ''
  - name: index
    display: Index value of the step
    type: text
  - name: onclick
    display: onClick
    type: text
*/
{% set bpr %}
import Step from '@mui/material/Step';
import StepLabel from '@mui/material/StepLabel'
{% if element.values.optional %}
  import Typography from '@mui/material/Typography'
{% endif %}
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Step
    {% if element.values.active %}
        active={ {{element.values.active}} }
    {% endif %}
    {% if element.values.index %}
        index='{{ element.values.index }}'
    {% endif %}
    {% if element.values.className %}
      className={ {{ element.values.className }} }
    {% endif %}
    {% if element.values.disabled %}
        disabled={ {{ element.values.disabled }} }
    {% endif %}
    {% if element.values.expanded %}
        expanded={ {{ element.values.expanded }} }
    {% endif %}
    {% if element.values.last %}
        last={ {{ element.values.last }} }
    {% endif %}
    {% if element.values.completed %}
        completed={ {{ element.values.completed }} }
    {% endif %}
    {% if element.values.open %}
        open={ {{ element.values.open | default(true) }} }
    {% endif %}
    {% if element.values.onclick %}
        onClick={(e) => { {{ element.values.onclick }}} }
    {% endif %}
    >
    <StepLabel
        {% if element.values.error %}
          error={ {{element.values.error}} }
        {% endif %}
        {% if element.values.optional %}
          optional={ <Typography variant="caption">{{element.values.optional}}</Typography> }
        {% endif %}
    >
        {{ element.values.label | default('') }}
    </StepLabel>
{{ content | raw }}
</Step>