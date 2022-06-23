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
    options: >-
      return aptugo.store.getState().application.tables.map(({ unique_id, name
      }) => [unique_id, name])
    required: true
  - name: condition
    display: Condition
    type: text
children: []
*/
{% if data %}{% set table = data | tableData %}{% else %}{% set table = element.values.data | tableData %}{% endif %}
{% set bpr %}
import { useDispatch } from 'react-redux'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set bpr %}
import { useSelector } from 'react-redux'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set bpr %}
import { IState } from '../store/reducers/index'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set bpr %}
import { add{{ table.name | friendly | capitalize }}, edit{{ table.name | friendly | capitalize }} } from '../store/actions/{{ table.name | friendly | lower }}Actions'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set ph %}
const dispatch = useDispatch()
{% endset %}
{{ save_delayed('ph', ph ) }}
{% if element.children %}
new Promise((resolve) => {
{% endif %}
{% if element.values.condition %}if ({{ element.values.condition }}) { {% endif %}
if (data._id) {
  dispatch(edit{{ table.name | friendly | capitalize }}(data as any))
} else {
  dispatch(add{{ table.name | friendly | capitalize }}(data as any))
}
{% if element.values.condition %}}{% endif %}
{% if element.children %}
  resolve('ok')
}).then(result => {
  {{ content | raw }}
})
{% endif %}