/*
path: addOnConnection.tpl
completePath: elements/Experimental/Sockets/addOnConnection.tpl
type: file
unique_id: addOnConnection
icon: f:addListener.svg
children: []
*/
{% set theconstructor %}
{{ content | raw }}
{% endset %}
{{ save_delayed('theconstructor',theconstructor) }}