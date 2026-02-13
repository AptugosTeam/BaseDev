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
*/

{% set bpr %}
import Field from '../components/Table/Field'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set bprB %}
import moment from 'moment'
{% endset %}
{{ save_delayed('bpr', bprB ) }}
<Field value={(fieldData: any) => moment(fieldData.{{ field.column_name | friendly }}).utc().format("{{field.dateFormat}}")}/>