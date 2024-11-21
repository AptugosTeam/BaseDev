/*
path: show.tpl
completePath: elements/Fields/Datetime/show.tpl
unique_id: x6nXr6Eu
settings:
  - name: Packages
    value: |-
      "moment": "latest",
      "react-moment": "latest",
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
{% set bprB %}
import moment from 'moment'
{% endset %}
{{ save_delayed('bpr', bprB ) }}
<Field {% if element.values.classname %} className={ {{ element.values.classname }} } {% endif %} value={(fieldData: any) => moment(fieldData.{{ field.column_name | friendly }}).format("{{field.dateFormat}}")}/>