/*
path: RadioGroup.tpl
completePath: elements/Material-UI/Forms/RadioGroup.tpl
type: file
unique_id: Fmr87CZF
order: 16
icon: f:../../Z-Icons/RadioGroup.svg
children: []
options:
  - name: value
    display: Value
    type: text
    options: ''
  - name: onchange
    display: On Change
    type: function
    options: ''
  - name: name
    display: Name attribute of the input element
    type: text
    options: ''
  - name: formControlClassName
    display: Form Control className
    type: styles
    options: ''
  - name: radioGroupClassname
    display: Radio Group Classname
    type: styles
    options: ''
  - name: error
    display: Error
    type: variable
    options: ''
  - name: separator
    display: Advanced Properties
    type: separator
    advanced: true
  - name: label
    display: Label
    type: text
    options: ''
    advanced: true
  - name: labelid
    display: Label ID
    type: text
    options: ''
    advanced: true
  - name: separator
    display: End Advanced Properties
    type: separator
    advanced: true
childs:
  - name: radio
    element: radio
*/

{% set bpr %}
  import Radio from '@mui/material/Radio';
  import RadioGroup from '@mui/material/RadioGroup';
  import FormControlLabel from '@mui/material/FormControlLabel';
  import FormControl from '@mui/material/FormControl';
  import FormLabel from '@mui/material/FormLabel';
{% endset %}
{{ save_delayed('bpr',bpr) }}

<FormControl component="fieldset" {% if element.values.formControlClassName %}className={ {{ element.values.formControlClassName }} }{% endif %}>
  {% if element.values.label %}
    <FormLabel id={{ element.values.labelid |textOrVariable }}>
      <label>{{ element.values.label }}</label>
    </FormLabel>
  {% endif %}
  <RadioGroup
    {% if element.values.label %}
      aria-labelledby={{ element.values.labelid |textOrVariable }}
    {% endif %}
    {% if element.values.onchange %}
      onChange={ {{ element.values.onchange | functionOrCall }} }
    {% endif %}
    {% if element.values.value %}
      value={ {{ element.values.value }} }
    {% endif %}
    {% if element.values.name %}
      name={{ element.values.name | textOrVariable }}
    {% endif %}
    {% if element.values.radioGroupClassname %}
      className={ {{ element.values.radioGroupClassname }} }
    {% endif %}
  >
    {{ content | raw }}
  </RadioGroup>
    {% if element.values.error %}
      {{element.values.error}}
    {% endif %}
</FormControl>