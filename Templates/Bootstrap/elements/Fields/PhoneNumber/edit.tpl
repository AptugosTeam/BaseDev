/*
path: edit.tpl
type: file
unique_id: VikMgaaaBcd
icon: ico-field
settings:
  - name: Packages
    value: '"material-ui-phone-number": "3.0.0",'
*/
{% set bpr %}
import MuiPhoneNumber from 'material-ui-phone-number'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set tableName = ( field | fieldData ).table.name | friendly %}
<MuiPhoneNumber defaultCountry={'us'} onChange={handleOnChange} value={ {{ tableName }}data.{{ field.column_name | friendly }}}/>