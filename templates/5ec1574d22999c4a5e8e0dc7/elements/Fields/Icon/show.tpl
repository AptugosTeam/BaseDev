/*
path: show.tpl
completePath: >-
  /Users/gastongorosterrazu/Aptugo/BaseDev/templates/5ec1574d22999c4a5e8e0dc7/elements/Fields/Icon/show.tpl
keyPath: elements/Fields/Icon/show.tpl
unique_id: RQm1x3xM
*/
{% set bpr %}
import Field from '../components/Table/Field'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<Field value={(fieldData: any) => fieldData.{{ field.column_name | friendly }}}/>