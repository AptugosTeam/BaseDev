/*
path: "{{ table.name |\_friendly |\_lower }}.routes.js"
type: file
unique_id: uPKnInsn
icon: ico-field
modelRelated: true
sourceType: javascript
subtype: Aptugo
children: []
*/
module.exports = (app) => {
  const {{ table.name | friendly | lower }} = require('../controllers/{{ table.name | friendly | lower }}.controller.js')
  {% if table.extraModules %}{{ table.extraModules }}{% endif %}

  {% for route in table.definedRoutes %}
    {% if route.route_active %}
      // {{ route.route_name }}
      app.{{ route.route_method }}('{{ parse(route.route_path, { route: route, table: table }) }}', (req, res) => {
        {% if route.route_template != 'source' %}
          {% include includeTemplate('Aptugo Routes' ~ route.route_template ~ '.tpl') %}
        {% else %}
          {{ route.route_code | raw }}
        {% endif %}
      })

    {% endif %}
  {% endfor %}
  {% if table.extraRoutes %}{{ table.extraRoutes }}{% endif %}
}
