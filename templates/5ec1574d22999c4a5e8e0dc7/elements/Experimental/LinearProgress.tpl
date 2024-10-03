/*
path: LinearProgress.tpl
completePath: elements/Material-UI/LinearProgress.tpl
type: file
unique_id: KMRaMcf7
icon: ico-box
sourceType: javascript
options:
  - name: value
    display: The value of the progress indicator. Value between 0 and 100.
    type: text
  - name: variant
    display: Variant to use
    type: dropdown
    options: 
      return [['indeterminate', 'Indeterminate'],['determinate', 'Determinate'],['buffer', 'Buffer'],['query', 'Query']]
    settings:
      default: 'indeterminate'
  - name: valueBuffer
    display: The value for the buffer variant. Value between 0 and 100.
    type: text
    options: ''
    settings:
      propertyCondition: variant
      condition: buffer
      active: true
  - name: sx
    display: Extra Styles
    type: text
    options: ''
  - name: className
    display: ClassName
    type: styles
    options: ''
children: []
*/
{% set bpr %}
import LinearProgress from '@mui/material/LinearProgress';
{% endset %}
{{ save_delayed('bpr', bpr) }}
<div
  {% if element.values.className %}
    className={ {{element.values.className|raw}} }
  {% endif %}
>
  <LinearProgress
    {% if element.values.value %}
      value={ {{ element.values.value | raw }}{{ value | raw }} }
    {% endif %}
    {% if element.values.variant %}
      variant="{{element.values.variant|default('indeterminate')}}"
    {% endif %}
    {% if element.values.valueBuffer %}
      valueBuffer={{ element.values.valueBuffer | textOrVariable }}
    {% endif %}
    {% if element.values.sx %}
      sx={ { {{ element.values.sx }} } }
    {% endif %}
  />
</div>
