/*
path: show.tpl
completePath: elements/Fields/Boolean/show.tpl
unique_id: RdoOPpQT
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
{% set bpr %}
import RadioButtonCheckedIcon from '@mui/icons-material/RadioButtonChecked'
import RadioButtonUncheckedIcon from '@mui/icons-material/RadioButtonUnchecked'
export { RadioButtonUncheckedIcon }
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<Field {% if element.values.classname %} className={ {{ element.values.classname }} } {% endif %} value={(fieldData: any) => fieldData.{{ field.column_name | friendly }} ? <RadioButtonCheckedIcon /> : <RadioButtonUncheckedIcon /> }/>

