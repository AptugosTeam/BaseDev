/*
path: show.tpl
completePath: elements/Fields/Datetime/show.tpl
unique_id: x6nXr6Eu
settings:
  - name: Packages
    value: |-
      "moment": "latest",
      "react-moment": "latest",
*/
{% set bpr %}
import Field from '../components/Table/Field'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set bprB %}
import moment from 'moment'
{% endset %}
{{ save_delayed('bpr', bprB ) }}
<Field value={(fieldData: any) => moment(fieldData.{{ field.column_name | friendly }}).format("{{field.dateFormat}}")}/>