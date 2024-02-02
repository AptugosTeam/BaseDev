/*
path:  Autocomplete.tpl
completePath: elements/Material-UI/Autocomplete.tpl
unique_id: 0WOt3nHt
children: []
options:
  - name: value
    display: Value
    type: text
    options: ''
  - name: onType
    display: OnType
    type: text
    options: ''
  - name: onChange
    display: On Change
    type: function
    options: ''
  - name: loading
    display: Loading
    type: text
    options: ''
  - name: label
    display: Label
    type: text
    options: ''
  - name: top100Films
    display: options
    type: text
    options: ''
  - name: className
    display: ClassName
    type: styles
    options: ''
  - name: placeholder
    display: Placeholder
    type: text
    options: ''
  - name: chips
    display: Chips
    type: checkbox
    advanced: true
    settings:
      default: false
  - name: margin
    display: margin
    type: dropdown
    options: dense;normal;none
  - name: variant
    display: Variant
    type: dropdown
    options: standard;filled;outlined
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
      {% if element.values.value %}value={{ element.values.value }}{% endif %}
      {% if element.values.onType %}onType ={ {{ element.values.onType }} } {% endif %}
      {% if element.values.onChange %} onChange ={ {{element.values.onChange}} } {% endif %}
      {% if element.values.loading %}loading ={ {{ element.values.loading }} } {% endif %}
      {% if element.values.top100Films %}options ={ {{ element.values.top100Films }} } {% endif %}
      {% if element.values.label %}label={{ element.values.label | textOrVariable }}{% endif %}
      {% if element.values.className %}className={ {{ element.values.className }} }{% endif %}
      {% if element.values.placeholder %}placeholder={{ element.values.placeholder | textOrVariable }}{% endif %}
      {% if element.values.variant %}variant={{ element.values.variant | textOrVariable }}{% endif %}
      {% if element.values.margin %}margin={{ element.values.margin | textOrVariable }}{% endif %}
      {% if element.values.chips %}chips{% endif %}
  />