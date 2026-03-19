/*
path: show.tpl
completePath: elements/Fields/Image/show.tpl
unique_id: Z1frMeIx
*/
{% set bpr %}
import Field from '../components/Table/Field'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set columnName = field.column_name | friendly %}
{% set path = '/img/${fieldData.' ~ columnName ~ '}' %}
{% if field.gcloud == '1' %}{% set path = '${fieldData.{{ columnName }}}' %}{% endif %}
<Field {% if element.values.classname %} className={ {{ element.values.classname }} } {% endif %} value={(fieldData: any) => fieldData.{{ columnName }} ? <img src={`{{ path }}`} /> : <div />} />
