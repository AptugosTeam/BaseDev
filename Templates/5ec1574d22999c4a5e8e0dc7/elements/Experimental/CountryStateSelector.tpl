/*
path:  CountryStateSelector.tpl
completePath: elements/Experimental/CountryStateSelector.tpl
unique_id: CSEbOrrq
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
  - name: country
    display: Country
    type: text
    options: ''
  - name: label
    display: Label
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
  - name: disabled
    display: Disabled
    type: text
    options: ''
settings:
  - name: Packages
    value: '"country-state-city": "^3.2.1",'
  - name: Packages
    value: '"react-select": "^5.8.0",'
helpText: >-
  The autocomplete is a normal text input enhanced by a panel of suggested options.
icon: ico-field
*/
{% set bpr %}
import CountryStateSelector from '@components/Autocomplete'
import TextField from '@mui/material/TextField'
import { Country, State, City } from 'country-state-city'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
 <CountryStateSelector
      {% if element.values.value %}value={{ element.values.value }}{% endif %}
      {% if element.values.onType %}onType ={ {{ element.values.onType }} } {% endif %}
      {% if element.values.onChange %} onChange ={ {{element.values.onChange}} } {% endif %}
      {% if element.values.country %}options={State.getStatesOfCountry({{ element.values.country | textOrVariable }}).map((provincia) => ({ label: provincia.name, value: provincia.name }))} {% endif %}
      {% if element.values.label %}label={{ element.values.label | textOrVariable }}{% endif %}
      {% if element.values.className %}className={ {{ element.values.className }} }{% endif %}
      {% if element.values.placeholder %}placeholder={{ element.values.placeholder | textOrVariable }}{% endif %}
      {% if element.values.variant %}variant={{ element.values.variant | textOrVariable }}{% endif %}
      {% if element.values.margin %}margin={{ element.values.margin | textOrVariable }}{% endif %}
      {% if element.values.chips %}chips{% endif %}
      {% if element.values.disabled %}disabled={ {{element.values.disabled}} } {% endif %}
  />