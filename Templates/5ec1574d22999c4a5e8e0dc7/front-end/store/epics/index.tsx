/*
path: index.tsx
completePath: front-end/store/epics/index.tsx
unique_id: 2yDQTtLe
*/

import { combineEpics, createEpicMiddleware } from 'redux-observable'
{% for table in application.tables %}
import {{ table.name | friendly | lower }}Epics from './{{ table.name | friendly | lower }}Epics'
{% endfor %}
import { IState } from '../reducers'
import { Action } from 'redux'

export const rootEpic = combineEpics(
{% for table in application.tables %}
  {{ table.name | friendly | lower }}Epics,
{% endfor %})

export default createEpicMiddleware<Action, Action, IState>();