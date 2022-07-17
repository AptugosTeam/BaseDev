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
    type: text
  - name: autosave
    display: Autosave on Change
    type: checkbox
children: []
*/
{% set theField = element.values.Field | fieldData %}
{
  name: '{{ theField.column_name }}',
  selector: '{{ theField.column_name }}',
  sortable: true,
  cell: (fieldData) => <Field value={fieldData.{{ theField.column_name }} } />
},
