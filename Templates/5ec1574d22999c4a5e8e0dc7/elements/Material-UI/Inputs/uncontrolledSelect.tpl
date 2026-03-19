/*
path: uncontrolledSelect.tpl
type: file
unique_id: KZo70Wel
display: Select (uncontrolled)
icon: ico-uncontrolled-select
order: 25
sourceType: javascript
options:
  - name: label
    display: Label
    type: text
    options: ''
  - name: value
    display: Value
    type: text
    options: ''
  - name: onChange
    display: On Change
    type: function
    options: ''
  - name: options
    display: Options
    type: text
    options: ''
  - name: defaultValue
    display: Default Value
    type: text
    options: ''
  - name: showall
    display: Show "All" for empty
    type: checkbox
  - name: margin
    display: Margin
    type: dropdown
    options: none;normal;dense
  - name: size
    display: Size
    type: dropdown
    options: medium;small
  - name: fullwidth
    display: Use full width?
    type: checkbox
  - name: className
    display: ClassName
    type: styles
    options: ''
  - name: extraStyles
    display: Extra Styles
    type: styles
    options: ''
  - name: shrink
    display: Shrink Label?
    type: checkbox
    settings:
      default: true
  - name: displayEmpty
    display: Display Empty?
    type: checkbox
    options: ''
  - name: displayEmptyText
    display: Display Empty Text
    type: text
    settings:
      condition: true
      propertyCondition: displayEmpty
  - name: endAdornment
    display: Child is end adornment
    type: checkbox
    advanced: true    
  - name: DisableVariable
    display: Variable to disable input
    type: text
  - name: disabled
    display: Disabled
    type: variable
    options: ''
    settings:
      active: true
  - name: error
    display: Error
    type: variable
    options: ''
  - name: helperText
    display: Helper Text
    type: text
  - name: alternativeOptions
    display: alternative Options
    type: checkbox
    advanced: true
    settings: 
      default: false

children: []
*/
{% set bpr %}
import TextField from '@mui/material/TextField'
import MenuItem from '@mui/material/MenuItem'
{% endset %}
{{ save_delayed('bpr', bpr) }}
{% if element.values.endAdornment %}
{% set bpr %}
import InputAdornment from '@mui/material/InputAdornment'
{% endset %}
{{ save_delayed('bpr', bpr) }}
{% endif %}

<TextField
    {% if element.values.Autofocus %}autoFocus{% endif %}
    {% if element.values.DisableVariable %}disabled={ {{ element.values.DisableVariable }} }{% endif %}
    {% if not element.values.shrink %}
      InputLabelProps={ { shrink: false, } }
    {% endif %}
    {% if element.values.disabled %}disabled={ {{element.values.disabled}} }{% endif %}
    margin='{{ element.values.margin|default("dense") }}'
    size='{{ element.values.size|default("medium") }}'
    {% if element.values.label %}label={{ element.values.label | textOrVariable }}{% endif %}
    {% if element.values.className %}className={ {{ element.values.className }} }{% endif %}
    {% if element.values.extraStyles %}style={ {{ element.values.extraStyles }} }{% endif %}
    select
    {% if element.values.fullwidth %}fullWidth{% endif %}
    {% if element.values.error %}error={ {{ element.values.error }} }{% endif %}
    {% if element.values.helperText %}helperText={ {{ element.values.helperText }} }{% endif %}
    {% if element.values.value %}value={{ element.values.value }}{% endif %}
    {% if element.values.onChange %}onChange={ {{ element.values.onChange | functionOrCall }} }{% endif %}
    {% if element.values.defaultValue %}defaultValue={{ element.values.defaultValue }}{% endif %}
    {% if element.values.displayEmpty %}SelectProps={ {
      displayEmpty: true
    } }{% endif %}
    {% if element.values.endAdornment %}
      InputProps={ {
        endAdornment: <InputAdornment position="end">{{ content | raw }}</InputAdornment>
      } }
    {% endif %}
>
{% if element.values.showall %}<MenuItem value="all"><em>All</em></MenuItem>{% endif %}
{% if element.values.displayEmptyText %}
<MenuItem value="" disabled>
  {{element.values.displayEmptyText}}
</MenuItem>
{% endif %}
{% if element.values.alternativeOptions %}
{ {{ element.values.options }} }
{{ content|raw }}
{% else %}
{ {{ element.values.options }}.map((item: { value: any, name: string } | any, index: number) => <MenuItem value={item?.value ? item.value : item} key={index}>{item?.name ? item.name : item}</MenuItem> )}
{% endif %}
</TextField>