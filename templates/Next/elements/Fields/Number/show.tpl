/*
path: show.tpl
completePath: elements/Fields/Number/show.tpl
unique_id: Tp07vbno
*/
{% set bpr %}
import Field from '../components/Table/Field'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<NumericFormat 
    {% if element.values.classname %} className={ {{ element.values.classname }} } {% endif %}
    value= { (fieldData: number) => fieldData.{{ field.column_name | friendly }} }
    displayType="text"
    {% if field.decimalScale %}
        decimalScale={ {{ field.decimalScale }} }
    {% endif %}
    {% if field.formatNumber == "dotComma" %}
        thousandSeparator="."
        decimalSeparator=","
    {% elseif field.formatNumber == "commaDot" %}
        thousandSeparator=","
        decimalSeparator="."
    {% else %}
        decimalSeparator=","
    {% endif %}
/>