/*
path: typesenseSearch.tpl
completePath: >-
  /Users/gastongorosterrazu/Aptugo/BaseDev/templates/Next/elements/Experimental/typesenseSearch.tpl
keyPath: elements/Experimental/typesenseSearch.tpl
unique_id: riZn4TX2
options:
  - name: collection
    display: Collection
    type: dropdown
    options: >-
      return [...aptugo.store.getState().application.tables.map(({ unique_id,name }) => [unique_id, name])]
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
    host: "localhost",
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
      {
        name: '{{ field.column_name | friendly | lower }}',
        type: 'string',
        facet: false,
      },
      {% endfor %}
    ]
  }

  createSchema(schema, typesenseClient)
  
  try {
    await monitorListingsUsingEventEmitter(db, typesenseClient)
  } catch (e) {
    console.error(e)
  }
}
{% endset %}
{{ add_setting('modelAddenum', modelAddenum, '/src/api-lib/db/articles.tsx') }}
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
    query_by: '{% for field in table.fields %}{% if field.data_type == 'String' or field.data_type == 'Wysiwyg' %}{{ field.column_name | friendly | lower }}, {% endif %}{% endfor %}'
  }})
  const searchClient = typesenseInstantsearchAdapter.searchClient;
{% endset %}
{{ save_delayed('ph',ph) }}
<InstantSearch indexName="articles" searchClient={searchClient}>
  <SearchBox />
  <Hits />
</InstantSearch>