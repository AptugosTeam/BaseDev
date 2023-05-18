/*
path: MUIAutocomplete.tpl
type: file
unique_id: MUIAUTOC
icon: ico-uncontrolled-input
sourceType: javascript
options:
  - name: onInputChange
    display: On Input Change
    type: function
    options: ''
  - name: label
    display: Label
    type: text
    options: ''
  - name: options
    display: Options
    type: text
    options: ''
children: []
*/
{% set bpr %}
import {Autocomplete as MUIAutocomplete}  from "@mui/material";
{% endset %}
{{ save_delayed('bpr', bpr) }}
<MUIAutocomplete
  {% if element.values.onInputChange %} onInputChange={ (e, input) => { {{ element.values.onInputChange }} }  } {% endif %}
  {% if element.values.onInputChange %} options={{ element.values.options | textOrVariable  }} {% endif %}
  renderInput={(params) => (
    <TextField {...params} label="{{ element.values.label|default('') }}" />
  )}
/>
