/*
path: show.tpl
completePath: elements/Fields/Password/show.tpl
unique_id: BRhZfZVu
*/
{% set bpr %}
import Field from '../components/Table/Field'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<Field {% if element.values.classname %} className={ {{ element.values.classname }} } {% endif %} value={'*****'}/>