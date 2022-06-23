/*
path: store.tsx
completePath: front-end/store/store.tsx
unique_id: 6E6TtRQh
*/
{% if application.tables.length > 0 %}{% set hasTables = true %}{% else %}{% set hasTables = false %}{% endif %}
import { applyMiddleware, createStore } from 'redux'
import { composeWithDevTools } from 'redux-devtools-extension'

import rootReducer, { initialState } from './reducers'
import epicMiddleware, { rootEpic } from './epics'

const composeEnhancer = process.env.NODE_ENV === 'development' ? composeWithDevTools({
  name: 'WebsiteVB'
}) : null

{% if hasTables %}
const store = createStore(
  rootReducer,
  initialState,
  process.env.NODE_ENV === 'development' ? composeEnhancer(applyMiddleware(epicMiddleware)) : applyMiddleware(epicMiddleware)
)

epicMiddleware.run(rootEpic)
{% else %}
const store = {}
{% endif %}

export default store
