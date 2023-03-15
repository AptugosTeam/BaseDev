/*
path: store.tsx
completePath: front-end/store/store.tsx
unique_id: 6E6TtRQh
*/
{% if application.tables.length > 0 %}{% set hasTables = true %}{% else %}{% set hasTables = false %}{% endif %}
import { applyMiddleware, createStore } from 'redux'
import { composeWithDevTools } from '@redux-devtools/extension'

import rootReducer, { initialState } from './reducers'
import epicMiddleware, { rootEpic } from './epics'

{% if hasTables %}
const store = createStore(
  rootReducer,
  initialState,
  applyMiddleware(epicMiddleware)
)

epicMiddleware.run(rootEpic)
{% else %}
const store = {}
{% endif %}

export default store