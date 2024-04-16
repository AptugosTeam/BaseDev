/*
path: '{{ table.name | friendly | lower }}Epics.tsx'
type: file
unique_id: 4of68M4F
icon: ico-field
sourceType: typescript
modelRelated: true
subtype: Any
children: []
*/
import { combineEpics, Epic } from "redux-observable";
import { switchMap, map, startWith, catchError, filter, mergeMap } from "rxjs/operators";
import axios from "axios";
import buildFormData from './buildFormData'
import {
  {{ table.name | friendly | capitalize }}Action,
  {{ table.name | friendly | capitalize }}ActionTypes,
  load{{ table.name | friendly | capitalize }},
  loaded{{ table.name | friendly | capitalize }},
  loading{{ table.name | friendly | capitalize }},
  loading{{ table.name | friendly | capitalize }}Failed,
  added{{ table.name | friendly | capitalize }},
  adding{{ table.name | friendly | capitalize }},
  adding{{ table.name | friendly | capitalize }}Failed,
  removed{{ table.singleName | friendly | capitalize }},
  removing{{ table.singleName | friendly | capitalize }},
  removing{{ table.singleName | friendly | capitalize }}Failed,
  edited{{ table.name | friendly | capitalize }},
  editing{{ table.name | friendly | capitalize }},
  editing{{ table.name | friendly | capitalize }}Failed,
  found{{ table.name | friendly | capitalize }},
  searching{{ table.name | friendly | capitalize }},
  searching{{ table.name | friendly | capitalize }}Failed
} from "../actions/{{ table.name | friendly | lower }}Actions"
  
import { IState } from "../reducers"
import { from, of } from "rxjs"
import { isOfType } from "typesafe-actions"

const search{{ table.name | friendly | capitalize }}Epic: Epic<{{ table.name | friendly | capitalize }}Action, {{ table.name | friendly | capitalize }}Action, IState> = (
  action$,
  state$
) =>
  action$.pipe(
    filter(isOfType({{ table.name | friendly | capitalize }}ActionTypes.SEARCH_{{ table.name | friendly | upper }})),
    mergeMap(action => {
      if (typeof action.searchOptions === "string") {
        action.searchOptions = {
          searchString: action.searchOptions,
          page: 1,
          searchField: '_id'
        }
      }
      let url = `${process.env.APIURL}/api/{{ table.name | friendly | lower }}/search/`
      return from(axios.get(url, { params: action.searchOptions } )).pipe(
        map(response => found{{ table.name | friendly | capitalize }}(response.data, action.keep)),
        startWith(searching{{ table.name | friendly | capitalize }}()),
        catchError(() => of(searching{{ table.name | friendly | capitalize }}Failed()))
      )
    })
  );

const load{{ table.name | friendly | capitalize }}Epic: Epic<{{ table.name | friendly | capitalize }}Action, {{ table.name | friendly | capitalize }}Action, IState> = (
  action$,
  state$
) => {
  let responses = []
  return action$.pipe(
    filter(isOfType({{ table.name | friendly | capitalize }}ActionTypes.LOAD_{{ table.name | friendly | upper }})),
    switchMap(action => {
      let url = `${process.env.APIURL}/api/{{ table.name | friendly | lower }}/`
      return from(axios.get(url, { params: action.loadOptions } )).pipe(
        map((response) => loaded{{ table.name | friendly | capitalize }}(response.data)),
        startWith(loading{{ table.name | friendly | capitalize }}()),
        catchError(() => of(loading{{ table.name | friendly | capitalize }}Failed()))
      )
    })
  )
}

const add{{ table.name | friendly | capitalize }}Epic: Epic<{{ table.name | friendly | capitalize }}Action, {{ table.name | friendly | capitalize }}Action, IState> = (
  action$,
  state$
) => action$.pipe(
  filter(isOfType({{ table.name | friendly | capitalize }}ActionTypes.ADD_{{ table.name | friendly | upper }})),

  mergeMap((action) => {
    const data = new FormData()
    buildFormData(data, action.payload)
    const config = {
      headers: {
          'content-type': 'multipart/form-data'
      }
    }
    
    return from(axios.post(`${process.env.APIURL}/api/{{ table.name | friendly | lower }}/`, data, config)).pipe(
      map((response) => added{{ table.name | friendly | capitalize }}(response.data)),
      startWith(adding{{ table.name | friendly | capitalize }}()),
      catchError((err) => of(adding{{ table.name | friendly | capitalize }}Failed(err.response)))
    )
  })
)

const remove{{ table.name | friendly | capitalize }}Epic: Epic<{{ table.name | friendly | capitalize }}Action, {{ table.name | friendly | capitalize }}Action, IState> = (
  action$,
  state$
) =>
  action$.pipe(
    filter(isOfType({{ table.name | friendly | capitalize }}ActionTypes.REMOVE_{{ table.singleName | friendly | upper }})),
    mergeMap((action) =>
      from(axios.delete(`${process.env.APIURL}/api/{{ table.name | friendly | lower }}/${action.payload._id}`)).pipe(
        map((response) => removed{{ table.singleName | friendly | capitalize }}()),
        startWith(removing{{ table.singleName | friendly | capitalize }}()),
        catchError(() => of(removing{{ table.singleName | friendly | capitalize }}Failed()))
      )
    )
  )
  
const edit{{ table.name | friendly | capitalize }}Epic: Epic<{{ table.name | friendly | capitalize }}Action, {{ table.name | friendly | capitalize }}Action, IState> = (
  action$,
  state$
) =>
  action$.pipe(
    filter(isOfType({{ table.name | friendly | capitalize }}ActionTypes.EDIT_{{ table.name | friendly | upper }})),
    mergeMap((action) => {
      const data = new FormData()
      buildFormData(data, action.payload)
      const config = {
        headers: {
            'content-type': 'multipart/form-data'
        }
      }

      

      return from(axios.put(`${process.env.APIURL}/api/{{ table.name | friendly | lower }}/${action.payload._id}`, data, config)).pipe(
        map((response) => edited{{ table.name | friendly | capitalize }}(response.data)),
        startWith(editing{{ table.name | friendly | capitalize }}()),
        catchError(() => of(editing{{ table.name | friendly | capitalize }}Failed()))
      )
    })
  )

export default combineEpics(search{{ table.name | friendly | capitalize }}Epic, load{{ table.name | friendly | capitalize }}Epic, add{{ table.name | friendly | capitalize }}Epic, remove{{ table.name | friendly | capitalize }}Epic, edit{{ table.name | friendly | capitalize }}Epic);