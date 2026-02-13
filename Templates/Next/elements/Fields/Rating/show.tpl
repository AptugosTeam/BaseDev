/*
path: show.tpl
type: file
unique_id: NmapgiRh
icon: file.svg
*/
{% set bpr %}
import Rating from '@mui/material/Rating';
{% endset %}
{{ save_delayed('bpr', bpr) }}
<Field {% if element.values.classname %} className={ {{ element.values.classname }} } {% endif %} value={(fieldData: any) => <Rating value={ fieldData.{{ field.column_name | friendly }} } readOnly /> } />
