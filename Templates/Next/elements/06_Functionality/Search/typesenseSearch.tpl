/*
path: typesenseSearch.tpl
keyPath: elements/Experimental/typesenseSearch.tpl
unique_id: riZn4TX2
options:
  - name: collection
    display: Collection
    type: dropdown
    options: >-
      return [...aptugo.store.getState().application.tables.map(({ unique_id,name }) => [unique_id, name])]
    settings:
      aptugoOnLoad: |-
        const element = arguments[0];
        var selectedTable = (element.values?.collection) ? element.values?.collection : null;
        if (selectedTable) {
          if (!element.moreOptions) element.moreOptions = []
          const allFields = aptugo.tableUtils.getAllFields(selectedTable)
          allFields.forEach(field => {
            if (field[3].data_type === 'String' || field[3].data_type === 'Computed' || field[3].data_type === 'Wysiwyg') {
              if (!element.moreOptions.find(eo => eo.name === `typesense_${field[3].column_name}`)) element.moreOptions.push({ name: `typesense_${field[3].column_name}`, display: `Search for ${field[1]}`, type: "checkbox" })
              if (!element.moreOptions.find(eo => eo.name === `typesense_facet_${field[3].column_name}`)) element.moreOptions.push({ name: `typesense_facet_${field[3].column_name}`, display: `Facet ${field[1]}`, type: "checkbox" })
            }
          })
        }
      active: true
  - name: hitsclassName
    display: ClassName For Results
    type: styles
  - name: searchclassName
    display: ClassName For Search Box
    type: styles
  - name: hideHits
    display: Hit initially hidden
    type: checkbox
extraFiles:
  - source: 'elements/Experimental/999_typesense.js'
    destination: '/src/api-lib/typesense.tsx'
settings:
  - name: Packages
    value: '"react-instantsearch": "^7.5.2","typesense": "^1.7.2","typesense-instantsearch-adapter": "^2.7.1",'
*/
{# Database Middleware Render #}
{% set databaseHeaderPiece %}
import Typesense from 'typesense'
{% endset %}
{{ add_setting('OnImportsDatabase', databaseHeaderPiece) }}
{% set databasePiece %}
let client = new Typesense.Client({
  nodes: [{
    host: "127.0.0.1",
    port: 8108,
    path: "",
    protocol: "http",
  }],
  apiKey: "xyz",
  connectionTimeoutSeconds: 2,
  cacheSearchResultsForSeconds: 2 * 60
})

const dbs = require('@api-lib/db')
Object.keys(dbs).filter(key => key.substring(0,15) === 'setupTypesense_').forEach(functionName => {
  dbs[functionName](client, req.db)
})
{% endset %}
{{ add_setting('OnSetupDatabase', databasePiece) }}
{# Model Position Render #}
{% set table = element.values.collection | tableData %}
{% set tableName = table.name | friendly | lower %}
{% set modelAddenumHead %}
import {createSchema, monitorListingsUsingEventEmitter} from '@api-lib/typesense'
{% endset %}
{{ add_setting('modelAddenumHead', modelAddenumHead) }}
{% set modelAddenum %}
export async function setupTypesense_{{ tableName }}(typesenseClient, db) {
  let schema = {
    name: '{{ tableName }}',
    fields: [
      {% for field in table.fields %}
        {% if element.values['typesense_' ~ (field.column_name | friendly)] %}
        {
          name: '{{ field.column_name | friendly }}',
          type: 'string',
          facet: {{ element.values['typesense_facet_' ~ (field.column_name | friendly)]|default(false) }},
        },
        {% endif %}
      {% endfor %}
    ]
  }

  const documents = await db.collection('{{ tableName }}').find({}).toArray()
  createSchema('{{ tableName }}', schema, typesenseClient, documents)
  
  try {
    await monitorListingsUsingEventEmitter(db, typesenseClient)
  } catch (e) {
    console.error(e)
  }
}
{% endset %}
{{ add_setting('modelAddenum', modelAddenum, '/src/api-lib/db/' ~ tableName ~ '.tsx') }}
{# Current Position Render #}
{% set bpr %}
  import { InstantSearch, SearchBox, Hits } from 'react-instantsearch'
  import TypesenseInstantSearchAdapter from "typesense-instantsearch-adapter"  
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set ph %}
  const typesenseInstantsearchAdapter = new TypesenseInstantSearchAdapter({
    server: {
      apiKey: "xyz", // Be sure to use an API key that only allows search operations
      nodes: [
        {
          host: "localhost",
          port: 8108,
          path: "", // Optional. Example: If you have your typesense mounted in localhost:8108/typesense, path should be equal to '/typesense'
          protocol: "http",
        },
      ],
      cacheSearchResultsForSeconds: 2 * 60, // Cache search results from server. Defaults to 2 minutes. Set to 0 to disable caching.
    },additionalSearchParameters: {
    query_by: '{% for field in table.fields %}{% if field.data_type == 'String' or field.data_type == 'Wysiwyg' %}{{ field.column_name | friendly }}, {% endif %}{% endfor %}'
  }})
  const searchClient = typesenseInstantsearchAdapter.searchClient;
{% endset %}
{{ save_delayed('ph',ph) }}
{% if element.values.hideHits %}
  {% include includeTemplate(['useState.tpl']) with { 'element': { 'values': { variableName: 'typesenseQuery', defaultValue: "''"} } } %}
{% endif %}
<InstantSearch
  indexName="{{ tableName }}"
  searchClient={searchClient}
  {% if element.values.hideHits %}
    onStateChange={(state) => { settypesenseQuery(state.uiState.{{ tableName }}.query || '') }}
  {% endif %}
>
  <SearchBox {% if element.values.searchclassName %}className={ {{element.values.searchclassName}} }{% endif %}  />
  {% if element.values.hideHits %}{typesenseQuery && {% endif %}
  <Hits {% if element.values.hitsclassName %}className={ {{element.values.hitsclassName}} }{% endif %} {% if element.children %}hitComponent={(props) => {% for child in element.children %}{{ child.rendered }}{% endfor %}}{% endif %}/>
  {% if element.values.hideHits %}}{% endif %}
</InstantSearch>