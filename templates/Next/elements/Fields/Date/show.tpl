/*
path: show.tpl
type: file
unique_id: pPHnrV0O
icon: ico-field
sourceType: javascript
children: []
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
<Field {% if element.values.classname %} className={ {{ element.values.classname }} } {% endif %} value={(fieldData: any) => moment(fieldData.{{ field.column_name | friendly }}).utc().format("{{field.dateFormat}}")}/>