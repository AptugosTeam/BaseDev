/*
path: return.tpl
completePath: >-
  /Users/gastongorosterrazu/Aptugo/BaseDev/templates/5ec1574d22999c4a5e8e0dc7/elements/Programming/return.tpl
keyPath: elements/Programming/return.tpl
unique_id: pUt3Vptf
*/
{% if not content %}return{% else %}return ({{ content | raw }}){% endif %}