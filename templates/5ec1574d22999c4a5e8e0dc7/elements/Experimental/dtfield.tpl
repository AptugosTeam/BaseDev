/*
path: dtfield.tpl
completePath: elements/Experimental/DataTable/dtfield.tpl
type: file
unique_id: datatablefield
icon: ico-field
sourceType: javascript
options:
  - name: Field
    display: Field
    type: dropdown
    options: return [['useVar','Use a Variable'], ...aptugo.tableUtils.getAllFields()]
  - name: fieldVariable
    display: Variable
    type: text
    settings:
      propertyCondition: Field
      condition: useVar
      active: true
  - name: columnName
    display: Label
    type: text
    settings:
      propertyCondition: Field
      condition: useVar
      active: true
  - name: size
    display: Size
    type: dropdown
    options: normal;small;medium
  - name: Type
    display: Type
    type: dropdown
    options: show;edit
  - name: Cut
    display: Cut after (n) chars
    type: text
    options: ''
  - name: CutOnNewline
    display: Cut on new line
    type: checkbox
    options: ''
  - name: Autofocus
    display: Auto Focus
    type: checkbox
    options: ''
  - name: DisableVariable
    display: Disable Variable
    type: text
    options: ''
  - name: DisableUnderline
    display: Disable Underline
    type: checkbox
    options: ''
  - name: margin
    display: margin
    type: dropdown
    options: dense;normal;none
  - name: variant
    display: Variant
    type: dropdown
    options: standard;filled;outlined
    settings:
      propertyCondition: Type
      condition: edit
  - name: classname
    display: ClassName
    type: styles
  - name: autosave
    display: Autosave on Change
    type: checkbox
  - name: renderChild
    display: Render Child as value
    type: checkbox
children: []
*/
{% if element.values.Field == "useVar" %}
  { id: '{{ element.values.fieldVariable }}', header: '{{ element.values.columnName }}', type: 'string', size: 300, {% if not element.values.renderChild %} renderValue: (cell) => { {{ content | raw}}; return cell.getValue() || '---'} }, {% endif %} {% if element.values.renderChild %} renderValue: (cell) => { return ({{ content | raw}}) } }, {% endif %} 
{% else %}
  {% if not field %}
    {% set field = element.values.Field | fieldData %}
  {% endif %}
  {% include includeTemplate(['Fields' ~ field.data_type ~'datatable.tpl', 'Fieldsdatatable.tpl']) %}
{% endif %}
