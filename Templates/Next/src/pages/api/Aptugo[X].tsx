/*
path: "{{ table.name |friendly |lower }}/index.tsx"
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
    {% set routeMiddlewares = route.route_middlewares|default([]) %}
    {% if route.route_middlewareAuth and routeMiddlewares.indexOf('auth') == -1 %}
      {% set routeMiddlewares = routeMiddlewares|merge(['auth']) %}
    {% endif %}
    {% set routeCode %}
      // --> {{ route.route_name }}
      {% if route.route_imports %}{% set mainRouteImports = mainRouteImports ~ route.route_imports ~ '\n' %}{% endif %}
      {% if route.route_template != 'source' %}
        handler.{{ route.route_method }}(
          applyRouteMiddlewares({{ routeMiddlewares|json_encode|raw }}, {% include includeTemplate('Aptugo Routes' ~ route.route_template ~ '.tpl') %})
        )
      {% else %}
        // {{ routeMiddlewares }}
        handler.{{ route.route_method }}(
          applyRouteMiddlewares({{ routeMiddlewares|json_encode|raw }}, async (req, res) => {
            {{ route.route_code | raw }}
          })
        )
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

{% set usesAuth = false %}
{% set usesBody = false %}
{% set usesParseBodyMiddleware = false %}
{% set usesUploads = false %}

{% for route in table.definedRoutes %}
  {% if route.route_active %}
    {% set routeMiddlewares = route.route_middlewares|default([]) %}
    {% if 'auth' in routeMiddlewares %}{% set usesAuth = true %}{% endif %}
    {% if 'body' in routeMiddlewares %}{% set usesBody = true %}{% endif %}
    {% if 'uploads' in routeMiddlewares %}{% set usesUploads = true %}{% endif %}
  {% endif %}
{% endfor %}

{% block baseRoute %}

import { ValidateProps } from "@api-lib/constants"

import {
  {% for subtable in application.tables %}
    {{ subtable.name | friendly }}Model,
  {% endfor %}
} from '@/models'
import { database{% if usesAuth %}, auths{% endif %}{% if usesBody %}, parseBody{% endif %} } from '@api-lib/middlewares'
import { ncOpts } from "@api-lib/nc"
import nc from "next-connect"
import mongoose from 'mongoose'
{% if usesParseBodyMiddleware %}import parseBodyMiddleware from '@lib/parseBodyMiddleware'{% endif %}
{% if usesUploads %}
import fs from 'fs'
import multer from 'multer'
import path from 'path'
{% endif %}
{{ mainRouteImports }}

{{ insert_setting(singleName ~ '_File_Start') |raw }}

{% if usesUploads or usesBody %}
export const config = {
  api: {
    bodyParser: false,
  },
}
{% endif %}

{% if usesUploads %}
const localTmp = path.join(process.cwd(), 'tmp')
if (!fs.existsSync(localTmp)) fs.mkdirSync(localTmp, { recursive: true })

const upload = multer({
  storage: multer.diskStorage({
    destination: localTmp,
    filename: (req, file, cb) => cb(null, `${Date.now()}-${file.originalname}`),
  }),
  limits: {
    fileSize: 5 * 1024 * 1024 * 1024, // limit file size to 5GB
  },
})
{% endif %}

const handler = nc(ncOpts)
handler.use(database)

const runMiddleware = (req, res, middleware) =>
  new Promise((resolve, reject) => {
    try {
      middleware(req, res, (result) => {
        if (result instanceof Error) return reject(result)
        return resolve(result)
      })
    } catch (e) {
      reject(e)
    }
  })

const applyRouteMiddlewares = (middlewares, handlerFn) => {
  return async (req, res) => {
    const middlewareList = Array.isArray(middlewares) ? middlewares : []

    for (const mw of middlewareList) {
      {% if usesAuth %}
      if (mw === 'auth') {
        for (const authMiddleware of auths) {
          await runMiddleware(req, res, authMiddleware)
        }
        continue
      }
      {% endif %}

      {% if usesUploads %}
      if (mw === 'uploads') {
        await runMiddleware(req, res, upload.any())
        continue
      }
      {% endif %}

      {% if usesBody %}
      if (mw === 'body') {
        await runMiddleware(req, res, parseBody)
        continue
      }
      {% endif %}
    }

    return handlerFn(req, res)
  }
}

{{ insert_setting(singleName ~ '_Middlewares') |raw }}

{{ mainRouteCode }}

export default handler

{% endblock %}

{# ADD EXTRA FILES FROM ROUTE #}
{% for externalRouteFile in externalRouteFiles %}
  {% set mainRouteCode = externalRouteFile.content %}
  {{ addExtraFile(externalRouteFile.path, block("baseRoute")) }}
{% endfor %}