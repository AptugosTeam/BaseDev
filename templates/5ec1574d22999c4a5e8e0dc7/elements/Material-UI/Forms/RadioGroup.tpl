/*
path: RadioGroup.tpl
completePath: elements/Material-UI/Forms/RadioGroup.tpl
type: file
unique_id: Fmr87CZF
icon: f:radio.svg
children: []
options:
  - name: onchange
    display: On Change
    type: function
    options: ''
  - name: value
    display: Value
    type: text
    options: ''
  - name: name
    display: Name
    type: text
    options: ''
childs:
  - name: Radio
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

  <FormControl>
        <RadioGroup
          {% if element.values.onchange %}
            onChange={ {{ element.values.onchange | functionOrCall }} }
          {% else %}
          {% endif %}
          {% if element.values.value %}
            value={{ element.values.value |textOrVariable }}
          {% else %}
          {% endif %}
          {% if element.values.name %}
            name={{ element.values.name | textOrVariable }}
          {% endif %}
        >
        {{ content | raw }}
        </RadioGroup>
      </FormControl>