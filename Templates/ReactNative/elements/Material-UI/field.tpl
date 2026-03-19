/*
path: field.tpl
type: file
unique_id: aqUmk84z
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
  - name: autocomplete
    display: Autofilling Input
    type: text
  - name: onBlur
    display: On Focus Lost
    type: function
    options: ''
    advanced: true
  - name: limit
    display: Limit of Elements
    type: text
    options: ''
    advanced: true
  - name: sortMethod
    display: Sort Method
    type: dropdown
    options: desc;asc
    advanced: true
  - name: sortLanguage
    display: Sort Language
    type: dropdown
    options: 
      return [['en', 'English'],['es', 'Spanish']]
    advanced: true
children: []
*/
{% set bpr %}
  import Field from '../components/Table/Field'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% if (element.values.Field) and (element.values.Field != 'useVar') %}
  {% set ph %}
  {% include includeTemplate('FieldseditInclude.tpl') with { 'tableInfo': element.values.Field | fieldData } %}
  {% endset %}
  {{ save_delayed('ph', ph ) }}
  {% set theField = element.values.Field | fieldData %}
{% else %}
  {% set theField = field %}
{% endif %}
{% if element.values.CutOnNewline %}
    {% set fieldValue = 'data.' ~ theField.column_name  ~ '.substr(0, data.' ~ theField.column_name ~ '.indexOf("\n"))' %}
{% else %}
    {% set fieldValue = theField.column_name %}
{% endif %}
{% if element.values.Field == 'useVar' %}
  {{ theField.rendered }}
{% else %}
  {% if element.values.Type == 'edit' %}{% include includeTemplate('Fields' ~ theField.data_type ~ 'edit.tpl') with theField %}
  {% else %}{% include includeTemplate('Fields' ~ theField.data_type ~ 'show.tpl') with theField %}{% endif %}
{% endif %}
