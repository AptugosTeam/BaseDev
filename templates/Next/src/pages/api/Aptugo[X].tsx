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
{% macro prepareRoute(routePath, tableName, singleName) %}
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
{% set tableName = table.name | friendly %}
{% set singleName = table.singleName | friendly | lower %}
{% set mainRouteCode = '' %}
{% set externalRouteFiles = [] %}
{% set mainRouteImports = '' %} 

{# Create Routes #}
{% for route in table.definedRoutes %}
  {% set mainLoopIndex = loop.index %}
  {% if route.route_active %}
    {% set routePath = parse(route.route_path, { route: route, table: table }) %}
    {% set routeCode %} 
      // {{ route.route_name }}
      {% if route.route_imports %}{% set mainRouteImports = mainRouteImports ~ route.route_imports ~ '\n' %}{% endif %}
      {% if route.route_template != 'source' %}
        handler.{{ route.route_method }}({% include includeTemplate('Aptugo Routes' ~ route.route_template ~ '.tpl') %})
      {% else %}
        handler.{{ route.route_method }}( async (req, res) => {
          {{ route.route_code | raw }}
        } )
      {% endif %}
    {% endset %}
    {% if routePath != '/api/' ~ (tableName|lower) %}
      {% set path = macros.prepareRoute(routePath, tableName|lower, singleName)|trim %}
      {{ fakeRoutePath(path) }}
      {% set externalRouteFile = { path: path, content: routeCode } %}
      {% set nrf = [] %}
      {% set notFound = true %}
      {% for erf in externalRouteFiles %}
        {% if erf.path == path %}
          {% set nrf = nrf|merge([{ path: erf.path, content: erf.content ~ routeCode }]) %}
          {% set notFound = false %}
          
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
  {% for subtable in application.tables %}
    {{ subtable.name | friendly }}Model,
  {% endfor %}
} from '@/models'
import { database, validateBody, parseBody } from "@api-lib/middlewares"
import { ncOpts } from "@api-lib/nc"
import nc from "next-connect"
import mongoose from 'mongoose'
import multer from 'multer'
import parseBodyMiddleware from '@lib/parseBodyMiddleware'
{{ mainRouteImports }}

{{ insert_setting(singleName ~ '_File_Start') |raw }}

export const config = {
  api: {
    bodyParser: false,
  },
}

const upload = multer({
  storage: multer.diskStorage({
    destination: '/tmp',
    filename: (req, file, cb) => cb(null, `${Date.now()}-${file.originalname}`),
  }),
  limits: {
    fileSize: 5 * 1024 * 1024 * 1024, // limit file size to 5GB
  },
})

const handler = nc(ncOpts)
handler.use(database)
handler.use(upload.any())
handler.use(parseBody)
handler.use(parseBodyMiddleware)
{{ insert_setting(singleName ~ '_Middlewares') |raw }}

{{ mainRouteCode }}

export default handler

{% endblock %}
{# ADD EXTRA FILES FROM ROUTE #}
{% for externalRouteFile in externalRouteFiles %}
  {% set mainRouteCode = externalRouteFile.content %}
  {{ addExtraFile(externalRouteFile.path, block("baseRoute")) }}
{% endfor %}

