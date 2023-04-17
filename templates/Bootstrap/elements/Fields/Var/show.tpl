/*
path: show.tpl
type: file
unique_id: wiqkXQou
icon: ico-field
children: []
*/
{% if element.children %}
<Field value={(fieldData: any) => {% for child in element.children %}{{ child.rendered | raw }}{% endfor %} }  />
{% else %}
<Field value={(fieldData: any) => {{ element.values.fieldVariable }} } />
{% endif %}
