/*
path: show.tpl
completePath: elements/Fields/MultilineString/show.tpl
unique_id: 1UVCZinf
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
{% if element.values.CutOnNewline %}
    <Field {% if element.values.classname %} className={ {{ element.values.classname }} } {% endif %} value={(fieldData: any) => fieldData.{{ field.column_name }}.substr(0, fieldData.{{ field.column_name }}.indexOf("\n") )}/>
{% else  %}
    <Field {% if element.values.classname %} className={ {{ element.values.classname }} } {% endif %} value={(fieldData: any) => fieldData.{{ field.column_name }}}/>
{% endif %}
