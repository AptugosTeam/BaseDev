/*
path: RadioGroup.tpl
completePath: elements/Material-UI/Forms/RadioGroup.tpl
type: file
unique_id: Fmr87CZF
icon: f:radio.svg
children: []
options:
  - name: checked
    display: Checked
    type: text
    options: ''
  - name: onchange
    display: On Change
    type: text
    options: ''
  - name: value
    display: Value
    type: text
    options: ''
  - name: name
    display: Name
    type: text
    options: ''
  - name: label
    display: label
    type: text
    options: ''
*/

{% set bpr %}
  import Radio from '@mui/material/Radio';
  import RadioGroup from '@mui/material/RadioGroup';
  import FormControlLabel from '@mui/material/FormControlLabel';
  import FormControl from '@mui/material/FormControl';
  import FormLabel from '@mui/material/FormLabel';
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% if element.values.label %}
    {% set bpr %}
      import FormControlLabel from '@mui/material/FormControlLabel'
    {% endset %}
  {{ save_delayed('bpr',bpr) }}
{% endif %}
  <FormControlLabel>
    {% if element.values.value %}
      value={{ element.values.value |textOrVariable }} 
    {% else %}
    {% endif %}
    label={{ element.values.label |textOrVariable }} control={
    {% endif %}   
        <RadioGroup
          aria-labelledby="demo-radio-buttons-group-label"
          defaultValue="female"
            {% if element.values.checked %}
              checked={ {{ element.values.checked}} }
            {% endif %}
            {% if element.values.value %}
              value={{ element.values.value |textOrVariable }}
            {% endif %}
            {% if element.values.name %}
              name={{ element.values.name | textOrVariable }}
            {% endif %}
        >

        </RadioGroup>
   </FormControlLabel>