/*
path: datatable.tpl
completePath: >-
  /Users/max/Aptugo/BaseDev/Templates/5ec1574d22999c4a5e8e0dc7/elements/Fields/GeoPoints/datatable.tpl
keyPath: elements/Fields/GeoPoints/datatable.tpl
type: file
unique_id: VFMHmAxod
icon: ico-field
sourceType: javascript
children: []
*/
{% set bpr %}
import Field from '../components/Table/Field'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{ id: '{{ field.column_name | friendly }}', header: '{{ field.displaylabel|default(field.column_name) }}', type: 'string', size: 300, renderValue: (cell) => { 
  return( 
    <Field value= { `[${cell?.row?.original?.{{ field.column_name | friendly }}?.coordinates[0]}-${cell?.row?.original?.{{ field.column_name | friendly }}?.coordinates[1]}]` } /> 
    )
  }
},