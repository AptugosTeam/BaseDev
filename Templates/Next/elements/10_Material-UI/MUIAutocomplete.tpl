/*
path: MUIAutocomplete.tpl
type: file
unique_id: MUIAUTOC
icon: ico-uncontrolled-input
sourceType: javascript
options:
  - name: className
    display: ClassName
    type: styles
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
  - name: filterOptions 
    display: Filter Options
    type: function
  - name: getOptionLabel 
    display: Get Option Label
    type: function
  - name: renderOption 
    display: Render Option
    type: function
  - name: label
    display: Label
    type: text
  - name: freeSolo
    display: Preserve Entry Text
    type: checkbox
  - name: selectOnFocus
    display: selectOnFocus
    type: checkbox
  - name: clearOnBlur
    display: clearOnBlur
    type: checkbox
  - name: handleHomeEndKeys
    display: handleHomeEndKeys
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
  - name: DisableVariable
    display: Variable to disable input
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
  - name: isOptionEqualToValue
    display: Is Option Equal to Value?
    type: function
    advanced: true
  - name: noOptionsText
    display: Display Text when No Options
    type: text
    advanced: true
  - name: textfieldPlaceholder
    display: Placeholder
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
  - name: inputAdornment
    display: Child is Input Adornment
    type: checkbox
    advanced: true
children: []
*/
{% set bpr %}
import {Autocomplete as MUIAutocomplete}  from "@mui/material";
import TextField from '@mui/material/TextField';
{% endset %}
{{ save_delayed('bpr', bpr) }}
{% if element.values.inputAdornment %}
{% set bpr %}
import InputAdornment from '@mui/material/InputAdornment'
{% endset %}
{{ save_delayed('bpr', bpr) }}
{% endif %}
<MUIAutocomplete
  {% if element.values.className %}
    className={ {{element.values.className|raw}} }
  {% endif %}
  {% if element.values.freeSolo %}
    freeSolo
  {% endif %}
  {% if element.values.selectOnFocus %}
    selectOnFocus
  {% endif %}
  {% if element.values.clearOnBlur %}
    clearOnBlur
  {% endif %}
  {% if element.values.handleHomeEndKeys %}
    handleHomeEndKeys
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
  {% if element.values.value %}
    value={ {{ element.values.value | raw }} }
  {% endif %}
  {% if element.values.options %} 
    options={ {{ element.values.options | raw  }} }
  {% else %}
    options={[]} 
  {% endif %}
  {% if element.values.DisableVariable %}
    disabled={ {{ element.values.DisableVariable }} }
  {% endif %}
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
  {% if element.values.isOptionEqualToValue %}
    isOptionEqualToValue={ (option, value) => {{ element.values.isOptionEqualToValue }} }
  {% endif %} 
  {% if element.values.onChange %}
    onChange={ (e, newValue) => {
        {{ element.values.onChange }} 
    }
  }
  {% endif %}
  {% if element.values.onInputChange %}
    onInputChange={ (e, newInputValue) => { 
      {{ element.values.onInputChange }} 
      }  
    }
  {% endif %} 
  {% if element.values.filterOptions %}
    filterOptions={ (options, params) => { 
      {{ element.values.filterOptions }} 
      }  
    }
  {% endif %}
  {% if element.values.getOptionLabel %}
    getOptionLabel={ (option) => { 
      {{ element.values.getOptionLabel }} 
      }  
    }
  {% endif %}
  {% if element.values.renderOption %}
    renderOption={ (props, option) => { 
      {{ element.values.renderOption }} 
      }  
    }
  {% endif %}
  renderInput={(params) => <TextField
    {...params}
    label=""
    {% if element.values.textfieldPlaceholder %}
    placeholder={{ element.values.textfieldPlaceholder | textOrVariable }}
    {% endif %}
    {% if element.values.inputAdornment %}
    InputProps={ {
      ...params.InputProps,
      startAdornment: (
        <InputAdornment position="start">
          {{ content | raw }}
        </InputAdornment>
      ),
    } }
    {% endif %} 
  />}

/>
