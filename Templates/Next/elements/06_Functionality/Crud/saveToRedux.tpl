/*
path: saveToRedux.tpl
display: Save to Database
type: file
unique_id: OhQu8og7
icon: ico-save-to-redux
sourceType: javascript
options:
  - name: data
    display: Data
    type: dropdown
    required: true
    options: >-
      return aptugo.store.getState().application.tables.map(({ unique_id, name
      }) => [unique_id, name])
  - name: condition
    display: Condition
    type: text
  - name: variablename
    display: Variable name to save
    type: variable
    settings:
      default: 'data'
children: []
*/
{% set bpr %}
import serializeData from '@lib/serializeData'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set bpr %}
import { fetcher } from "@lib/fetch"
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% if data %}{% set table = data | tableData %}{% else %}{% set table = element.values.data | tableData %}{% endif %}
{% if element.children %}
new Promise((resolve) => {
{% endif %}
{% if element.values.condition %}if ({{ element.values.condition }}) { {% endif %}
let method = 'POST'
if ({{ element.values.variablename | default('data') }}._id) method = 'PUT'
try {
  const formData = serializeData({{ element.values.variablename | default('data') }})
  fetcher(`/api/{{ table.name | friendly | lower }}${method === 'PUT' ? '/' + {{ element.values.variablename | default('data') }}._id : ''}`, {
    method: method,
    body: formData,
  }).then(() => {
    {% if element.children %}
      resolve('ok')
    }).then(result => {
      {{ content | raw }}
    {% endif %}
  })
} catch (e) {
  console.log('catch', e)
}
{% if element.values.condition %}if ({{ element.values.condition }}) } {% endif %}
})