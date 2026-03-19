/*
path: apr.tpl
completePath: elements/Aptugo Internal Use/apr.tpl
unique_id: LqzNhqB4
children: []
icon: ico-field
helpText: After Page Render
*/
</React.Fragment>)}

{% for delay in delayed %}
{{ delay }}
{% endfor %}

export default {{ page.name | friendly }}


