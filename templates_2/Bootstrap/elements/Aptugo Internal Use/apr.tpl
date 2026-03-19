/*
path: apr.tpl
completePath: elements/Aptugo Internal Use/apr.tpl
unique_id: LqzNhqB4
children: []
icon: ico-field
helpText: After Page Render
*/
<div className={classes.navBar}></div>
<div className={classes.mainContainer}>change me</div>
</>)}

{% for delay in delayed %}
{{ delay }}
{% endfor %}

export default {{ page.name | friendly }}


