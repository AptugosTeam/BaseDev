/*
path: field.tpl
type: file
unique_id: aqUmk84z
icon: ico-field
renderTag: 'td'
sourceType: javascript
options:
  - name: Field
    display: Field
    type: dropdown
    options: return [['useVar','Use a Variable'], ...aptugo.tableUtils.getAllFields()]
    settings:
      aptugoOnChange: >-
        const value = arguments[0];
        const element = arguments[1];
        const page = arguments[2];
        if (value !== 'useVar') {
          const tableName = aptugoUtils.helpers.friendly(aptugoUtils.findContainerTable(value).name);
          aptugo.variables.setPageVariable(page, 'id' + element.unique_id, { [`initialData${tableName}`]: null });
          aptugo.variables.setPageVariable(page, element.unique_id, { [`${tableName}data`]: null });
          aptugo.variables.setPageFunction(page, 'f' + element.unique_id, `set${tableName}data` );
        }
      active: true
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
  - name: disableLabel
    display: Disable Label
    type: checkbox
    options: ''
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
  - name: maxLength
    display: Max Characters Length
    type: text
    options: ''
  - name: margin
    display: margin
    type: dropdown
    options: dense;normal;none
  - name: maxLength
    display: Max Characters Length
    type: text
    options: ''
  - name: variant
    display: Variant
    type: dropdown
    options: standard;filled;outlined
    settings:
      propertyCondition: Type
      condition: edit
  - name: size
    display: Size
    type: dropdown
    options: medium;small
    settings:
      propertyCondition: Type
      condition: edit
  - name: classname
    display: ClassName
    type: styles
  - name: autosave
    display: Autosave on Change
    type: checkbox
  - name: autocomplete
    display: Autofilling Input
    type: text
  - name: fieldname
    display: Field Name
    type: text
    options: ''
  - name: inputLabel
    display: Input Label
    type: text
    options: ''
  - name: placeholder
    display: Placeholder
    type: text
    options: ''
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
  - name: selectedFields
    display: Selected Fields to Retrieve (space between)
    type: text
    options: ''
    advanced: true
  - name: InputProps
    display: Input Props (allows min and max date)
    type: text
    options: ''
    advanced: true
    settings:
      propertyCondition: Type
      condition: edit
children: []
*/
{% set bpr %}
  import Field from '../components/Table/Field'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% if (element.values.Field) and (element.values.Field != 'useVar') %}
  {% set ph %}
  {% include includeTemplate('FieldseditInclude.tpl') with { 'tableInfo': element.values.Field | fieldData } %}
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
