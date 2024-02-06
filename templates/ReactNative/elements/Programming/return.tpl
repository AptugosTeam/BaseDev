/*
path: return.tpl
keyPath: elements/Programming/return.tpl
unique_id: pUt3Vptf
*/
{% if not content %}return{% else %}return ({{ content | raw }}){% endif %}