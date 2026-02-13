/*
path: show.tpl
keyPath: elements/Fields/Currency/show.tpl
unique_id: ho99hhyR
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
<Field {% if element.values.classname %} className={ {{ element.values.classname }} } {% endif %} value={(fieldData: any) => new Intl.NumberFormat('{{ field.locale|default('en-US') }}', { style: 'currency', currency: '{{ field.currency|default('USD') }}' }).format(fieldData.{{ field.column_name | friendly }})}/>