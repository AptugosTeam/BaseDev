/*
path: show.tpl
completePath: >-
  /Users/gastongorosterrazu/Aptugo/BaseDev/templates/5ec1574d22999c4a5e8e0dc7/elements/Fields/Currency/show.tpl
keyPath: elements/Fields/Currency/show.tpl
unique_id: ho99hhyR
*/
{% set bpr %}
import Field from '../components/Table/Field'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<Field value={(fieldData: any) => new Intl.NumberFormat('{{ field.locale|default('en-US') }}', { style: 'currency', currency: '{{ field.currency|default('USD') }}' }).format(fieldData.{{ field.column_name | friendly }})}/>