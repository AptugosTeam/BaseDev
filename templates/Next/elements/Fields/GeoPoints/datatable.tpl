/*
path: datatable.tpl
keyPath: elements/Fields/GeoPoints/datatable.tpl
type: file
unique_id: VFMHmAxod
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
{% set bpr %}
import Field from '@components/Table/Field'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{ id: '{{ field.column_name | friendly }}', header: '{{ field.displaylabel|default(field.column_name) }}', type: 'string', size: 300, renderValue: (cell) => { 
  return( 
    <Field value= { `[${cell?.row?.original?.{{ field.column_name | friendly }}?.coordinates[0]}-${cell?.row?.original?.{{ field.column_name | friendly }}?.coordinates[1]}]` } /> 
    )
  }
},