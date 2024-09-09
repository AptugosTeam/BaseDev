/*
path: index.tsx
completePath: front-end/store/reducers/index.tsx
unique_id: nh3VWVzs
*/
import { combineReducers } from 'redux'

{% for table in application.tables %}
import {{ table.name | friendly | lower }}Reducer, { I{{ table.name | friendly | capitalize }}State, initial{{ table.name | friendly | capitalize }}State } from './{{ table.name | friendly | lower }}Reducer'
{% endfor %}

export interface IState {
{% for table in application.tables %}
  {{ table.name | friendly | lower }}: I{{ table.name | friendly | capitalize }}State,
{% endfor %}
}

export const initialState: IState = {
{% for table in application.tables %}
  {{ table.name | friendly | lower }}: initial{{ table.name | friendly | capitalize }}State,
{% endfor %}
}

export default combineReducers({
{% for table in application.tables %}
  {{ table.name | friendly | lower }}: {{ table.name | friendly | lower }}Reducer,
{% endfor %}
})