/*
path: raw.tpl
keyPath: elements/Fields/Datetime/raw.tpl
unique_id: NuOBxyqH
settings:
  - name: Packages
    value: |-
      "moment": "latest",
      "react-moment": "latest",
*/
{% set bprB %}
import moment from 'moment'
{% endset %}
{{ save_delayed('bpr', bprB ) }}
{ moment({{ pre }}{{ field.column_name | friendly }}).format("{{field.dateFormat}}") }