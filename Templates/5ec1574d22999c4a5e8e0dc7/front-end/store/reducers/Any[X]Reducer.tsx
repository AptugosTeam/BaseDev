/*
path: '{{ table.name | friendly | lower }}Reducer.tsx'
completePath: front-end/store/reducers/Any[X]Reducer.tsx
unique_id: xFiytkIa
children: []
modelRelated: true
helpText: Reducer file
subtype: Any
*/
{% set tableNameCap = table.name | friendly | capitalize %}
{% set tableNameLow = table.name | friendly | lower %}
{% set tableNameUp = table.name | friendly | upper %}

import produce from 'immer'
import { ApiStatus, Ipaginated{{ tableNameCap }}, I{{ tableNameCap }}Item } from '../models'
import { {{ tableNameCap }}Action, {{ tableNameCap }}ActionTypes } from '../actions/{{ tableNameLow }}Actions'

export const initial{{ tableNameCap }}State: I{{ tableNameCap }}State = {
  loadingStatus: ApiStatus.NOTLOADED,
  addingStatus: ApiStatus.NOTLOADED,
  searchingStatus: ApiStatus.NOTLOADED,
  searchString: '',
  {{ tableNameLow }}: [],
  found{{ tableNameLow }}: [],
  totalDocs: 0,
  errMessage: '',
  errStatus: null,
  errField: null
}

export default function {{ tableNameLow }}Reducer(state: I{{ tableNameCap }}State = initial{{ tableNameCap }}State, action: {{ tableNameCap }}Action) {
  return produce(state, draft => {
    switch (action.type) {
      case {{ tableNameCap }}ActionTypes.SEARCH_{{ tableNameUp }}:
        draft.searchString = action.searchOptions.searchString
        break
      case {{ tableNameCap }}ActionTypes.SEARCHING_{{ tableNameUp }}:
        draft.searchingStatus = ApiStatus.LOADING
        draft.loadingStatus = ApiStatus.NOTLOADED
        draft.addingStatus = ApiStatus.NOTLOADED
        break

      case {{ tableNameCap }}ActionTypes.SEARCHING_{{ tableNameUp }}_FAILED:
        draft.searchingStatus = ApiStatus.FAILED
        break

      case {{ tableNameCap }}ActionTypes.FOUND_{{ tableNameUp }}:
        draft.searchingStatus = ApiStatus.LOADED
        action.keep ? draft.found{{ tableNameLow }}.push(...action.payload.{{ tableNameLow }}.docs) : draft.found{{ tableNameLow }} = action.payload.{{ tableNameLow }}.docs
        draft.totalDocs = action.payload.{{ tableNameLow }}.totalDocs
        break
        
      case {{ tableNameCap }}ActionTypes.LOAD_{{ tableNameUp }}:
      case {{ tableNameCap }}ActionTypes.LOADING_{{ tableNameUp }}:
        draft.loadingStatus = ApiStatus.LOADING
        draft.addingStatus = ApiStatus.NOTLOADED
        draft.searchingStatus = ApiStatus.NOTLOADED
        draft.found{{ tableNameLow }} = []
        break

      case {{ tableNameCap }}ActionTypes.LOADING_{{ tableNameUp }}_FAILED:
        draft.loadingStatus = ApiStatus.FAILED
        break

      case {{ tableNameCap }}ActionTypes.LOADED_{{ tableNameUp }}:
        draft.loadingStatus = ApiStatus.LOADED
        draft.{{ tableNameLow }} = action.payload.{{ tableNameLow }}.docs
        draft.totalDocs = action.payload.{{ tableNameLow }}.totalDocs
        break

      case {{ tableNameCap }}ActionTypes.ADD_{{ tableNameUp }}:
      case {{ tableNameCap }}ActionTypes.ADDING_{{ tableNameUp }}:
        draft.addingStatus = ApiStatus.LOADING
        draft.searchingStatus = ApiStatus.NOTLOADED
        draft.errMessage = ''
        draft.errStatus = null
        draft.errField = null
        break

      case {{ tableNameCap }}ActionTypes.ADDING_{{ tableNameUp }}_FAILED:
        draft.addingStatus = ApiStatus.FAILED
        draft.errMessage = action.message
        draft.errStatus = action.status
        draft.errField = action.field
        break

      case {{ tableNameCap }}ActionTypes.ADDED_{{ tableNameUp }}:
        draft.addingStatus = ApiStatus.LOADED
        draft.errStatus = 200
        draft.{{ tableNameLow }}.push(action.payload.{{ tableNameLow }}.docs[0])
        if (draft.searchString) draft.found{{ tableNameLow }}.push(action.payload.{{ tableNameLow }}.docs[0])
        break
        
      case {{ tableNameCap }}ActionTypes.REMOVE_{{ table.singleName | friendly | upper }}:
        draft.{{ tableNameLow }}.splice(draft.{{ tableNameLow }}.findIndex({{ table.singleName | friendly | lower }} => {{ table.singleName | friendly | lower }}._id === action.payload._id), 1)
        break
        
      case {{ tableNameCap }}ActionTypes.EDIT_{{ tableNameUp }}:
        draft.loadingStatus = ApiStatus.NOTLOADED
        draft.addingStatus = ApiStatus.LOADING
        draft.searchingStatus = ApiStatus.NOTLOADED
        draft.{{ tableNameLow }}[draft.{{ tableNameLow }}.findIndex(
          ({{ table.singleName | friendly | lower }}) => {{ table.singleName | friendly | lower }}._id === action.payload._id)] = action.payload
        break
        
      case {{ tableNameCap }}ActionTypes.EDITED_{{ tableNameUp }}:
        draft.addingStatus = ApiStatus.LOADED
        draft.{{ tableNameLow }}[draft.{{ tableNameLow }}.findIndex(
          ({{ table.singleName | friendly | lower }}) => {{ table.singleName | friendly | lower }}._id === action.payload._id)] = action.payload
        draft.found{{ tableNameLow }}[draft.found{{ tableNameLow }}.findIndex(
          ({{ table.singleName | friendly | lower }}) => {{ table.singleName | friendly | lower }}._id === action.payload._id)] = action.payload
        break
    }
  })
}

export interface I{{ tableNameCap }}State {
  loadingStatus: ApiStatus
  addingStatus: ApiStatus
  searchingStatus: ApiStatus
  searchString: string
  {{ tableNameLow }}: I{{ tableNameCap }}Item[]
  found{{ tableNameLow }}: I{{ tableNameCap }}Item[]
  totalDocs: number
  errMessage?: string
  errStatus?: number
  errField?: string
}
