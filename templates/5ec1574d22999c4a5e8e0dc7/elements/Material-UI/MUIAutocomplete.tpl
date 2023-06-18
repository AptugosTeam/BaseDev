/*
path: MUIAutocomplete.tpl
type: file
unique_id: MUIAUTOC
icon: ico-uncontrolled-input
sourceType: javascript
options:
  - name: options
    display: Options
    type: text
    required: true
  - name: value
    display: Value
    type: text
  - name: onChange
    display: On Change
    type: function
  - name: label
    display: Label
    type: text
  - name: className
    display: ClassName
    type: styles
  - name: freeSolo
    display: Preserve Entry Text
    type: checkbox
  - name: filterSelectedOptions
    display: Hide Selected Value from List
    type: checkbox
  - name: separator
    display: Advanced Properties
    type: separator
    advanced: true
  - name: getOptionLabel
    display: Get Option Label
    type: function
    advanced: true
  - name: inputValue
    display: Input Value
    type: text
    advanced: true
  - name: onInputChange
    display: On Input Change
    type: function
    advanced: true
  - name: onClose
    display: On Close
    type: function
    advanced: true
  - name: noOptionsText
    display: Display Text when No Options
    type: text
    advanced: true
  - name: clearText
    display: Tooltip text on Clear Button
    type: text
    advanced: true
  - name: openText
    display: Tooltip text Open Button
    type: text
    advanced: true
  - name: closeText
    display: Tooltip text on Close Button
    type: text
    advanced: true
  - name: fullWidth
    display: Full Width
    type: checkbox
    advanced: true
  - name: multiple
    display: Multiple Selections
    type: checkbox
    advanced: true
children: []
*/
{% set bpr %}
import {Autocomplete as MUIAutocomplete}  from "@mui/material";
{% endset %}
{{ save_delayed('bpr', bpr) }}
<MUIAutocomplete
  {% if element.values.className %}
    className={ {{element.values.className|raw}} }
  {% endif %}
  {% if element.values.options %} 
    options={ {{ element.values.options | raw  }} }
  {% else %}
    options={[]} 
  {% endif %}
  {% if element.values.value %}
    value={ {{ element.values.value | raw }} }
  {% endif %}
  {% if element.values.onChange %}
    onChange={ (e, newValue) => {
        {{ element.values.onChange }} 
    }
  }
  {% endif %}
  {% if element.values.freeSolo %}
    freeSolo
  {% endif %}
  {% if element.values.filterSelectedOptions %}
    filterSelectedOptions
  {% endif %}
  {% if element.values.fullWidth %}
    fullWidth
  {% endif %}
  {% if element.values.multiple %}
    multiple
  {% endif %}
  {% if element.values.getOptionLabel %}
    getOptionLabel={ (option) => {
        {{ element.values.getOptionLabel }} 
    }}
  {% endif %}
  {% if element.values.onInputChange %}
    onInputChange={ (e, newInputValue) => { 
      {{ element.values.onInputChange }} 
      }  
    }
  {% endif %} 
  {% if element.values.onClose %}
    onClose={ (e, reason) => { 
      {{ element.values.onClose }} 
      }  
    }
  {% endif %} 
  renderInput={(params) => (
    <TextField {...params} label="{{ element.values.label|default('') }}" />
  )}
  {% if element.values.noOptionsText %}
    noOptionsText={{ element.values.noOptionsText | textOrVariable }}
  {% endif %}
  {% if element.values.clearText %}
    clearText={{ element.values.clearText | textOrVariable }}
  {% endif %}
  {% if element.values.openText %}
    openText={{ element.values.openText | textOrVariable }}
  {% endif %}
  {% if element.values.closeText %}
    closeText={{ element.values.closeText | textOrVariable }}
  {% endif %}

/>
