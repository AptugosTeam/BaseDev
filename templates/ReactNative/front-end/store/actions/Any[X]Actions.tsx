/*
path: "{{ table.name | friendly |\_lower }}Actions.tsx"
type: file
unique_id: UTGQ0azc
icon: ico-field
modelRelated: true
sourceType: typescript
subtype: Any
children: []
*/
import { I{{ table.name | friendly | capitalize }}Item, Ipaginated{{ table.name | friendly | capitalize }} } from "../models";

export enum {{ table.name | friendly | capitalize }}ActionTypes {
  SEARCH_{{ table.name | friendly | upper }} = '{{ table.name | friendly | lower }}/search',
  SEARCHING_{{ table.name | friendly | upper }} = '{{ table.name | friendly | lower }}/searching',
  FOUND_{{ table.name | friendly | upper }} = '{{ table.name | friendly | lower }}/found',
  SEARCHING_{{ table.name | friendly | upper }}_FAILED = '{{ table.name | friendly | lower }}/searching_failed',

  LOAD_{{ table.name | friendly | upper }} = '{{ table.name | friendly | lower }}/load',
  LOADING_{{ table.name | friendly | upper }} = '{{ table.name | friendly | lower }}/loading',
  LOADED_{{ table.name | friendly | upper }} = '{{ table.name | friendly | lower }}/loaded',
  LOADING_{{ table.name | friendly | upper }}_FAILED = '{{ table.name | friendly | lower }}/loading_failed',

  ADD_{{ table.name | friendly | upper }} = '{{ table.name | friendly | lower }}/add',
  ADDING_{{ table.name | friendly | upper }} = '{{ table.name | friendly | lower }}/adding',
  ADDED_{{ table.name | friendly | upper }} = '{{ table.name | friendly | lower }}/added',
  ADDING_{{ table.name | friendly | upper }}_FAILED = '{{ table.name | friendly | lower }}/adding_failed',
  
  REMOVE_{{ table.singleName | friendly | upper }} = '{{ table.name | friendly | lower }}/remove',
  REMOVING_{{ table.singleName | friendly | upper }} = '{{ table.name | friendly | lower }}/removing',
  REMOVED_{{ table.singleName | friendly | upper }} = '{{ table.name | friendly | lower }}/removed',
  REMOVING_{{ table.singleName | friendly | upper }}_FAILED = '{{ table.name | friendly | lower }}/removing_failed',
  
  EDIT_{{ table.name | friendly | upper }} = '{{ table.name | friendly | lower }}/edit',
  EDITING_{{ table.name | friendly | upper }} = '{{ table.name | friendly | lower }}/editing',
  EDITED_{{ table.name | friendly | upper }} = '{{ table.name | friendly | lower }}/edited',
  EDITING_{{ table.name | friendly | upper }}_FAILED = '{{ table.name | friendly | lower }}/editing_failed'
}

export function search{{ table.name | friendly | capitalize }}(searchOptions: TSearchOptions | string, keep?: boolean): ISearch{{ table.name | friendly | capitalize }}Action {
  return {
    type: {{ table.name | friendly | capitalize }}ActionTypes.SEARCH_{{ table.name | friendly | upper }},
    searchOptions: typeof searchOptions === 'string' ? { searchString: searchOptions } : searchOptions,
    keep: keep
  }
}

export function searching{{ table.name | friendly | capitalize }}(): ISearching{{ table.name | friendly | capitalize }}Action {
  return {
    type: {{ table.name | friendly | capitalize }}ActionTypes.SEARCHING_{{ table.name | friendly | upper }}
  }
}

export function found{{ table.name | friendly | capitalize }}({{ table.name | friendly | lower }}: Ipaginated{{ table.name | friendly | capitalize }}, keep?: boolean): IFound{{ table.name | friendly | capitalize }}Action {
  return {
    type: {{ table.name | friendly | capitalize }}ActionTypes.FOUND_{{ table.name | friendly | upper }},
    keep: keep,
    payload: {
      {{ table.name | friendly | lower }}
    }
  }
}

export function searching{{ table.name | friendly | capitalize }}Failed(): ISearching{{ table.name | friendly | capitalize }}FailedAction {
  return {
    type: {{ table.name | friendly | capitalize }}ActionTypes.SEARCHING_{{ table.name | friendly | upper }}_FAILED
  }
}

export function load{{ table.name | friendly | capitalize }}(loadOptions: TSearchOptions): ILoad{{ table.name | friendly | capitalize }}Action {
  return {
    type: {{ table.name | friendly | capitalize }}ActionTypes.LOAD_{{ table.name | friendly | upper }},
    loadOptions: loadOptions
  }
}

export function loading{{ table.name | friendly | capitalize }}(): ILoading{{ table.name | friendly | capitalize }}Action {
  return {
    type: {{ table.name | friendly | capitalize }}ActionTypes.LOADING_{{ table.name | friendly | upper }}
  }
}

export function loaded{{ table.name | friendly | capitalize }}({{ table.name | friendly | lower }}: Ipaginated{{ table.name | friendly | capitalize }}): ILoaded{{ table.name | friendly | capitalize }}Action {
  return {
    type: {{ table.name | friendly | capitalize }}ActionTypes.LOADED_{{ table.name | friendly | upper }},
    payload: {
      {{ table.name | friendly | lower }}
    }
  }
}

export function loading{{ table.name | friendly | capitalize }}Failed(): ILoading{{ table.name | friendly | capitalize }}FailedAction {
  return {
    type: {{ table.name | friendly | capitalize }}ActionTypes.LOADING_{{ table.name | friendly | upper }}_FAILED
  }
}

export function add{{ table.name | friendly | capitalize }}({{ table.singleName | friendly | lower }}: I{{ table.name | friendly | capitalize }}Item): IAdd{{ table.name | friendly | capitalize }}Action {
  return {
    type: {{ table.name | friendly | capitalize }}ActionTypes.ADD_{{ table.name | friendly | upper }},
    payload: {{ table.singleName | friendly | lower }}
  }
}

export function adding{{ table.name | friendly | capitalize }}(): IAdding{{ table.name | friendly | capitalize }}Action {
  return {
    type: {{ table.name | friendly | capitalize }}ActionTypes.ADDING_{{ table.name | friendly | upper }}
  }
}

export function added{{ table.name | friendly | capitalize }}({{ table.name | friendly | lower }}: Ipaginated{{ table.name | friendly | capitalize }}): IAdded{{ table.name | friendly | capitalize }}Action {
  return {
    type: {{ table.name | friendly | capitalize }}ActionTypes.ADDED_{{ table.name | friendly | upper }},
    payload: {
      {{ table.name | friendly | lower }}
    }
  }
}

export function adding{{ table.name | friendly | capitalize }}Failed(errData: { data: { message: string, field?: string }, status: number }): IAdding{{ table.name | friendly | capitalize }}FailedAction {
  return {
    type: {{ table.name | friendly | capitalize }}ActionTypes.ADDING_{{ table.name | friendly | upper }}_FAILED,
    message: errData.data.message,
    status: errData.status,
    field: errData.data.field
  }
}

export function remove{{ table.singleName | friendly | capitalize }}({{ table.singleName | friendly | lower }}: I{{ table.name | friendly | capitalize }}Item): IRemove{{ table.singleName | friendly | capitalize }}Action {
  return {
    type: {{ table.name | friendly | capitalize }}ActionTypes.REMOVE_{{ table.singleName | friendly | upper }},
    payload: {{ table.singleName | friendly | lower }}
  }
}

export function removing{{ table.singleName | friendly | capitalize }}(): IRemoving{{ table.singleName | friendly | capitalize }}Action {
  return {
    type: {{ table.name | friendly | capitalize }}ActionTypes.REMOVING_{{ table.singleName | friendly | upper }},
  }
}

export function removed{{ table.singleName | friendly | capitalize }}(): IRemoved{{ table.singleName | friendly | capitalize }}Action {
  return {
    type: {{ table.name | friendly | capitalize }}ActionTypes.REMOVED_{{ table.singleName | friendly | upper }}
  }
}

export function removing{{ table.singleName | friendly | capitalize }}Failed(): IRemoving{{ table.singleName | friendly | capitalize }}FailedAction {
  return {
    type: {{ table.name | friendly | capitalize }}ActionTypes.REMOVING_{{ table.singleName | friendly | upper }}_FAILED,
  }
}

export function edit{{ table.name | friendly | capitalize }}({{ table.singleName | friendly | lower }}: I{{ table.name | friendly | capitalize }}Item): IEdit{{ table.name | friendly | capitalize }}Action {
  return {
    type: {{ table.name | friendly | capitalize }}ActionTypes.EDIT_{{ table.name | friendly | upper }},
    payload: {{ table.singleName | friendly | lower }}
  }
}

export function editing{{ table.name | friendly | capitalize }}(): IEditing{{ table.name | friendly | capitalize }}Action {
  return {
    type: {{ table.name | friendly | capitalize }}ActionTypes.EDITING_{{ table.name | friendly | upper }},
  }
}

export function edited{{ table.name | friendly | capitalize }}({{ table.name | friendly | lower }}: I{{ table.name | friendly | capitalize }}Item): IEdited{{ table.name | friendly | capitalize }}Action {
  return {
    type: {{ table.name | friendly | capitalize }}ActionTypes.EDITED_{{ table.name | friendly | upper }},
    payload: {{ table.name | friendly | lower }}
  }
}

export function editing{{ table.name | friendly | capitalize }}Failed(): IEditing{{ table.name | friendly | capitalize }}FailedAction {
  return {
    type: {{ table.name | friendly | capitalize }}ActionTypes.EDITING_{{ table.name | friendly | upper }}_FAILED,
  }
}

type TSearchOptions = {
  searchString?: string
  searchField?: string
  page?: number
  limit?: number
  populate?: boolean
  sort?: {
    field: string
    method?: 'asc' | 'desc'
  }
  filters?: { field: string, value: string }[]
}

export interface ISearch{{ table.name | friendly | capitalize }}Action {
  type: {{ table.name | friendly | capitalize }}ActionTypes.SEARCH_{{ table.name | friendly | upper }}
  searchOptions: TSearchOptions
  keep?: boolean
}

export interface ISearching{{ table.name | friendly | capitalize }}Action {
  type: {{ table.name | friendly | capitalize }}ActionTypes.SEARCHING_{{ table.name | friendly | upper }}
}

export interface IFound{{ table.name | friendly | capitalize }}Action {
  type: {{ table.name | friendly | capitalize }}ActionTypes.FOUND_{{ table.name | friendly | upper }}
  keep?: boolean
  payload: {
    {{ table.name | friendly | lower }}: Ipaginated{{ table.name | friendly | capitalize }}
  }
}

export interface ISearching{{ table.name | friendly | capitalize }}FailedAction {
  type: {{ table.name | friendly | capitalize }}ActionTypes.SEARCHING_{{ table.name | friendly | upper }}_FAILED
}

export interface ILoad{{ table.name | friendly | capitalize }}Action {
  type: {{ table.name | friendly | capitalize }}ActionTypes.LOAD_{{ table.name | friendly | upper }}
  loadOptions: TSearchOptions
}

export interface ILoading{{ table.name | friendly | capitalize }}Action {
  type: {{ table.name | friendly | capitalize }}ActionTypes.LOADING_{{ table.name | friendly | upper }}
}

export interface ILoaded{{ table.name | friendly | capitalize }}Action {
  type: {{ table.name | friendly | capitalize }}ActionTypes.LOADED_{{ table.name | friendly | upper }}
  payload: {
    {{ table.name | friendly | lower }}: Ipaginated{{ table.name | friendly | capitalize }}
  }
}

export interface ILoading{{ table.name | friendly | capitalize }}FailedAction {
  type: {{ table.name | friendly | capitalize }}ActionTypes.LOADING_{{ table.name | friendly | upper }}_FAILED
}

export interface IAdd{{ table.name | friendly | capitalize }}Action {
  type: {{ table.name | friendly | capitalize }}ActionTypes.ADD_{{ table.name | friendly | upper }}
  payload: I{{ table.name | friendly | capitalize }}Item
}

export interface IAdding{{ table.name | friendly | capitalize }}Action {
  type: {{ table.name | friendly | capitalize }}ActionTypes.ADDING_{{ table.name | friendly | upper }}
}

export interface IAdded{{ table.name | friendly | capitalize }}Action {
  type: {{ table.name | friendly | capitalize }}ActionTypes.ADDED_{{ table.name | friendly | upper }}
  payload: {
    {{ table.name | friendly | lower }}: Ipaginated{{ table.name | friendly | capitalize }};
  }
}

export interface IAdding{{ table.name | friendly | capitalize }}FailedAction {
  type: {{ table.name | friendly | capitalize }}ActionTypes.ADDING_{{ table.name | friendly | upper }}_FAILED
  message: string
  status: number
  field?: string
}

export interface IRemove{{ table.singleName | friendly | capitalize }}Action {
  type: {{ table.name | friendly | capitalize }}ActionTypes.REMOVE_{{ table.singleName | friendly | upper }}
  payload: I{{ table.name | friendly | capitalize }}Item
}

export interface IRemoving{{ table.singleName | friendly | capitalize }}Action {
  type: {{ table.name | friendly | capitalize }}ActionTypes.REMOVING_{{ table.singleName | friendly | upper }}
}

export interface IRemoved{{ table.singleName | friendly | capitalize }}Action {
  type: {{ table.name | friendly | capitalize }}ActionTypes.REMOVED_{{ table.singleName | friendly | upper }}
}

export interface IRemoving{{ table.singleName | friendly | capitalize }}FailedAction {
  type: {{ table.name | friendly | capitalize }}ActionTypes.REMOVING_{{ table.singleName | friendly | upper }}_FAILED
}

export interface IEdit{{ table.name | friendly | capitalize }}Action {
  type: {{ table.name | friendly | capitalize }}ActionTypes.EDIT_{{ table.name | friendly | upper }}
  payload: I{{ table.name | friendly | capitalize }}Item
}

export interface IEditing{{ table.name | friendly | capitalize }}Action {
  type: {{ table.name | friendly | capitalize }}ActionTypes.EDITING_{{ table.name | friendly | upper }}
}

export interface IEdited{{ table.name | friendly | capitalize }}Action {
  type: {{ table.name | friendly | capitalize }}ActionTypes.EDITED_{{ table.name | friendly | upper }},
  payload: I{{ table.name | friendly | capitalize }}Item
}

export interface IEditing{{ table.name | friendly | capitalize }}FailedAction {
  type: {{ table.name | friendly | capitalize }}ActionTypes.EDITING_{{ table.name | friendly | upper }}_FAILED
}

export type {{ table.name | friendly | capitalize }}Action = 
  | ISearch{{ table.name | friendly | capitalize }}Action
  | ISearching{{ table.name | friendly | capitalize }}Action
  | IFound{{ table.name | friendly | capitalize }}Action
  | ISearching{{ table.name | friendly | capitalize }}FailedAction
  | ILoad{{ table.name | friendly | capitalize }}Action
  | ILoading{{ table.name | friendly | capitalize }}Action
  | ILoaded{{ table.name | friendly | capitalize }}Action
  | ILoading{{ table.name | friendly | capitalize }}FailedAction
  | IAdd{{ table.name | friendly | capitalize }}Action
  | IAdding{{ table.name | friendly | capitalize }}Action
  | IAdded{{ table.name | friendly | capitalize }}Action
  | IAdding{{ table.name | friendly | capitalize }}FailedAction
  | IRemove{{ table.singleName | friendly | capitalize }}Action
  | IRemoving{{ table.singleName | friendly | capitalize }}Action
  | IRemoved{{ table.singleName | friendly | capitalize }}Action
  | IRemoving{{ table.singleName | friendly | capitalize }}FailedAction
  | IEdit{{ table.name | friendly | capitalize }}Action
  | IEditing{{ table.name | friendly | capitalize }}Action
  | IEdited{{ table.name | friendly | capitalize }}Action
  | IEditing{{ table.name | friendly | capitalize }}FailedAction