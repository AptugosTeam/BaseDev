/*
path: show.tpl
type: file
unique_id: IV3Bf9aL
icon: ico-field
sourceType: javascript
children: []
extraFiles:
  - source: 'elements/99_ExtraFiles/Table/Field.tsx'
    destination: 'src/components/Table/Field.tsx'
  - source: 'elements/99_ExtraFiles/Table/table.module.scss'
    destination: 'src/components/Table/table.module.scss'
  - source: 'elements/99_ExtraFiles/Table/Table.tsx'
    destination: 'src/components/Table/Table.tsx'
*/
{% set referencedField = field.reference | fieldData %}
{% set referencedString = 'fieldData.' ~  (field.column_name | friendly)  %}
{% if referencedField.table.subtype == 'Aptugo' %}
  {% if field.relationshipType == '1:1' %}
    {% set referencedString = referencedString ~ '.' ~ (referencedField.column_name | friendly) %}
  {% else %}
    {% set referencedString = referencedString ~ '.' ~ (referencedField.column_name | friendly) %}
  {% endif %}
{% endif %}
{% set bpr %}
import Field from '@components/Table/Field'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% if field.displaytype == 'chips' %}
<Field value={(fieldData: any) => fieldData.{{ field.column_name | friendly }}?.map(item => <span key={`autocomplete_${item._id}`} {% if element.values.classname %} className={ {{ element.values.classname }} } {% else %} className={classes.tableChip} {% endif %}>{item.{{ referencedField.column_name | friendly }}}</span>) } />
{% else %}
  <Field {% if element.values.classname %} className={ {{ element.values.classname }} } {% endif %} value={(fieldData: any) => {{ 'fieldData.' ~  (field.column_name | friendly) }} ? {{ referencedString }} : '' }/>
{% endif %}