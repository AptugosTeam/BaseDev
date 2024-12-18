/*
path: "{{ table.name |\_friendly |\_lower }}/index.tsx"
type: file
unique_id: aqp3dURo
icon: ico-field
modelRelated: true
sourceType: javascript
subtype: Aptugo
children: []
*/
{% macro prepareRoute(routePath, tableName) %}
  {% set parts = routePath|split('/api/' ~ tableName ~ '/')|last %}
  {% set folderStructure = parts|split('/') %}
  {% set outFolder = [] %}
  {% for folder in folderStructure %}
    {% if folder|first == ':' %}
      {% set folder = '[' ~ folder|slice(1) ~ ']' %}
    {% endif %}
    {% set outFolder = outFolder|merge([folder]) %}
  {% endfor %}
  {% set folderStructure = outFolder|join('/') ~ '/index.tsx' %}
  {% set externalRouteFile = 'src/pages/api/' ~ tableName ~ '/' ~ folderStructure %}
  {{ externalRouteFile }}
{% endmacro %}

{# Definitions #}
{% import _self as macros %}
{% set tableName = table.name | friendly | lower %}
{% set singleName = table.singleName | friendly | lower %}
{% set mainRouteCode = '' %}
{% set externalRouteFiles = [] %}

{# Create Routes #}
{% for route in table.definedRoutes %}
  {% if route.route_active %}
    {% set routePath = parse(route.route_path, { route: route, table: table }) %}
    {% set routeCode %} 
      // {{ route.route_name }}
      {% if route.route_template != 'source' %}
        handler.{{ route.route_method }}({% include includeTemplate('Aptugo Routes' ~ route.route_template ~ '.tpl') %})
      {% else %}
        handler.{{ route.route_method }}(
          {{ route.route_code | raw }}
        )
      {% endif %}
    {% endset %}
    {% if routePath != '/api/' ~ tableName %}
      {% set path = macros.prepareRoute(routePath, tableName)|trim %}
      {% set externalRouteFile = { path: path, content: routeCode } %}
      {% set nrf = externalRouteFiles %}
      {% set notFound = true %}
      {% for erf in externalRouteFiles %}
        {% if erf.path == path %}
          {% set notFound = false %}
          {% set nrf = nrf|merge([{ path: erf.path, content: erf.content ~ routeCode }]) %}
        {% endif %}
      {% endfor %}
      {% if notFound %}
        {% set nrf = nrf|merge([externalRouteFile]) %}
      {% endif %}
      {% set externalRouteFiles = externalRouteFiles|merge(nrf) %}
    {% else %}
      {% set mainRouteCode = mainRouteCode ~ routeCode %}
    {% endif %}
  {% endif %}
{% endfor %}
{% block baseRoute %}
import { ValidateProps } from "@api-lib/constants"
import {
  find{{ tableName }},
  count{{ tableName }},
  insert{{ singleName }},
  update{{ singleName }}ById,
  find{{ singleName }}ById,
  delete{{ singleName }}ById,
} from "@api-lib/db"
import { database, validateBody, parseBody } from "@api-lib/middlewares"
import { ncOpts } from "@api-lib/nc"
import nc from "next-connect"
import multer from 'multer'

export const config = {
  api: {
    bodyParser: false,
  },
}

const upload = multer({ 
  storage: multer.diskStorage({
    filename: (_req, file, callback) => {
      const uniqueFileName = Date.now() + '-' + file.originalname;
      callback(null, uniqueFileName)
    },
    destination: (_req, _file, callback) => {
      callback(null, './public/img')
    }
  }),
  limits: {
    fileSize: 5 * 1024 * 1024
  }
})

const handler = nc(ncOpts)
handler.use(database)
handler.use(upload.single('file'))
handler.use(parseBody)
{{ mainRouteCode }}
export default handler
{% endblock %}
{# ADD EXTRA FILES FROM ROUTE #}
{% for externalRouteFile in externalRouteFiles %}
  {% set mainRouteCode = externalRouteFile.content %}
  {{ addExtraFile(externalRouteFile.path, block("baseRoute")) }}
{% endfor %}

