/*
path: return.tpl
keyPath: elements/Programming/return.tpl
unique_id: pUt3Vptf
order: 10
color: rgb(255, 192, 128)
icon: ico-return
*/
{% if not content %}return{% else %}return ({{ content | raw }}){% endif %}