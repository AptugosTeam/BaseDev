/*
path: updateImports.tpl
completePath: >-
  /Users/Shared/Dev/BaseDev/Templates/5ec1574d22999c4a5e8e0dc7/elements/Fields/Image/updateImports.tpl
keyPath: elements/Fields/Image/updateImports.tpl
unique_id: 3O7vkLOQ
*/
{% if field.useWatermark == '1' %}
const imageWatermark = require('../services/imageWatermark')
{% endif %}