/*
path: uncontrolledSelect.tpl
type: file
unique_id: KZo70Wel
icon: ico-uncontrolled-select
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
  - name: shrink
    display: Shrink Label?
    type: checkbox
    settings:
      default: true
  - name: DisableVariable
    display: Variable to disable input
    type: text
  - name: disabled
    display: Disabled
    type: variable
    options: ''
    settings:
      active: true
children: []
*/


{% set bpr %}
import TextField from '@mui/material/TextField'
import MenuItem from '@mui/material/MenuItem'
{% endset %}
{{ save_delayed('bpr', bpr) }}

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
    select
    {% if element.values.fullwidth %}fullWidth{% endif %}
    {% if element.values.value %}value={{ element.values.value }}{% endif %}
    {% if element.values.onChange %}onChange={ {{ element.values.onChange | functionOrCall }} }{% endif %}
    {% if element.values.defaultValue %}defaultValue={{ element.values.defaultValue }}{% endif %}
>
{% if element.values.showall %}<MenuItem value="all"><em>All</em></MenuItem>{% endif %}
{ {{ element.values.options }}.map((item: { value: any, name: string } | any, index: number) => <MenuItem value={item?.value ? item.value : item} key={index}>{item?.name ? item.name : item}</MenuItem> )}
</TextField>
