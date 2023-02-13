/*
path:  Autocomplete.tpl
completePath: elements/Material-UI/Autocomplete.tpl
unique_id: 0WOt3nHt
children: []
options:
  - name: width
    display: Width
    type: styles
    options: ''
  - name: top100Films
    display: options
    type: function
    options: ''
  - name: onChange
    display: On Change
    type: function
    options: ''
  - name: label
    display: Label
    type: text
    options: ''
helpText: >-
  The autocomplete is a normal text input enhanced by a panel of suggested options.
icon: ico-field
*/
{% set bpr %}
import Autocomplete from '@mui/material/Autocomplete';
import TextField from '@mui/material/TextField'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
 <Autocomplete
      disablePortal
      {% if element.values.width %}
       sx ={ { width: {{ width: element.values.width }} } }
      {% endif %}
      {% if element.values.top100Films %}
       options ={ {{ element.values.top100Films }} }
      {% endif %}
      {% if element.values.onChange %} onChange ={ (e) => {{element.values.onChange}} } {% endif %}
      renderInput={(params) => <TextField {...params}
      {% if element.values.label %}label={{ element.values.label | textOrVariable }}{% endif %}
      />}
  />