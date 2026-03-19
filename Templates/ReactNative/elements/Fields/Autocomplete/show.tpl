/*
path: show.tpl
type: file
unique_id: IV3Bf9aL
icon: ico-field
sourceType: javascript
children: []
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
import Field from '../components/Table/Field'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% if field.displaytype == 'chips' %}
<Field value={(fieldData: any) => fieldData.{{ field.column_name | friendly }}?.map(item => <span key={`autocomplete_${item._id}`} className={classes.tableChip}>{item.{{ referencedField.column_name | friendly }}}</span>) } />
{% else %}
  <Field value={(fieldData: any) => {{ 'fieldData.' ~  (field.column_name | friendly) }} ? {{ referencedString }} : '' }/>
{% endif %}