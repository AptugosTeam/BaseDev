/*
path: '{{ table.name | friendly | lower }}Slice.tsx'
type: file
unique_id: slice_{{ table.name | friendly | lower }}
icon: ico-field
sourceType: typescript
modelRelated: true
subtype: Any
children: []
*/
import { createSlice, createAsyncThunk, PayloadAction } from '@reduxjs/toolkit'
import axios from 'axios'
import buildFormData from '../epics/buildFormData'
import { I{{ table.name | friendly | capitalize }}Item } from '../models'

const API_URL = `{{ settings.apiURL | raw }}/api/{{ table.name | friendly | lower }}/`

interface {{ table.name | friendly | capitalize }}State {
  list: I{{ table.name | friendly | capitalize }}Item[]
  loading: boolean
  error: string | null
  page: number
  totalDocs: number
}

const initialState: {{ table.name | friendly | capitalize }}State = {
  list: [],
  loading: false,
  error: null,
  page: 1,
  totalDocs: 0,
}

export const search{{ table.name | friendly | capitalize }} = createAsyncThunk(
  '{{ table.name | friendly | lower }}/search',
  async (options: any = {}, { rejectWithValue }) => {
    try {
      let params = options
      if (typeof options === "string") {
        params = { searchString: options, page: 1, searchField: '_id' }
      }
      const response = await axios.get(`${API_URL}search/`, { params })
      return { data: response.data, keep: options.keep }
    } catch (err: any) {
      return rejectWithValue(err.response?.data || 'Error searching')
    }
  }
)

export const load{{ table.name | friendly | capitalize }} = createAsyncThunk(
  '{{ table.name | friendly | lower }}/load',
  async (loadOptions: any = {}, { rejectWithValue }) => {
    try {
      const response = await axios.get(API_URL, { params: loadOptions })
      return response.data
    } catch (err: any) {
      return rejectWithValue(err.response?.data || 'Error loading')
    }
  }
)

export const add{{ table.name | friendly | capitalize }} = createAsyncThunk(
  '{{ table.name | friendly | lower }}/add',
  async (payload: any, { rejectWithValue }) => {
    try {
      const data = new FormData()
      buildFormData(data, payload)
      const config = { headers: { 'content-type': 'multipart/form-data' } }
      const response = await axios.post(API_URL, data, config)
      return response.data
    } catch (err: any) {
      return rejectWithValue(err.response?.data || 'Error adding')
    }
  }
)

export const edit{{ table.name | friendly | capitalize }} = createAsyncThunk(
  '{{ table.name | friendly | lower }}/edit',
  async (payload: any, { rejectWithValue }) => {
    try {
      const data = new FormData()
      buildFormData(data, payload)
      const config = { headers: { 'content-type': 'multipart/form-data' } }
      const response = await axios.put(`${API_URL}${payload._id}`, data, config)
      return response.data
    } catch (err: any) {
      return rejectWithValue(err.response?.data || 'Error editing')
    }
  }
)

export const remove{{ table.singleName | friendly | capitalize }} = createAsyncThunk(
  '{{ table.name | friendly | lower }}/remove',
  async (item: any, { rejectWithValue }) => {
    try {
      await axios.delete(`${API_URL}${item._id}`)
      return item._id
    } catch (err: any) {
      return rejectWithValue(err.response?.data || 'Error removing')
    }
  }
)

const {{ table.name | friendly | lower }}Slice = createSlice({
  name: '{{ table.name | friendly | lower }}',
  initialState,
  reducers: {
    resetState: () => initialState,
  },
  extraReducers: (builder) => {
    builder
      // SEARCH
      .addCase(search{{ table.name | friendly | capitalize }}.pending, (state) => { state.loading = true })
      .addCase(search{{ table.name | friendly | capitalize }}.fulfilled, (state, action) => {
        state.loading = false
        if (action.payload.keep) {
          state.list = [...state.list, ...action.payload.data]
        } else {
          state.list = action.payload.data
        }
      })
      .addCase(search{{ table.name | friendly | capitalize }}.rejected, (state, action) => {
        state.loading = false
        state.error = action.payload as string
      })
      // LOAD
      .addCase(load{{ table.name | friendly | capitalize }}.pending, (state) => { state.loading = true })
      .addCase(load{{ table.name | friendly | capitalize }}.fulfilled, (state, action) => {
        state.loading = false
        if (action.payload.docs) {
            state.list = action.payload.docs
            state.totalDocs = action.payload.totalDocs
            state.page = action.payload.page
        } else {
            state.list = action.payload
        }
      })
      .addCase(load{{ table.name | friendly | capitalize }}.rejected, (state, action) => {
        state.loading = false
        state.error = action.payload as string
      })
      // ADD
      .addCase(add{{ table.name | friendly | capitalize }}.pending, (state) => { state.loading = true })
      .addCase(add{{ table.name | friendly | capitalize }}.fulfilled, (state, action) => {
        state.loading = false
        state.list.push(action.payload)
      })
      .addCase(add{{ table.name | friendly | capitalize }}.rejected, (state, action) => {
        state.loading = false
        state.error = action.payload as string
      })
      // EDIT
      .addCase(edit{{ table.name | friendly | capitalize }}.pending, (state) => { state.loading = true })
      .addCase(edit{{ table.name | friendly | capitalize }}.fulfilled, (state, action) => {
        state.loading = false
        const index = state.list.findIndex(item => item._id === action.payload._id)
        if (index !== -1) {
          state.list[index] = action.payload
        }
      })
      .addCase(edit{{ table.name | friendly | capitalize }}.rejected, (state, action) => {
        state.loading = false
        state.error = action.payload as string
      })
      // REMOVE
      .addCase(remove{{ table.singleName | friendly | capitalize }}.pending, (state) => { state.loading = true })
      .addCase(remove{{ table.singleName | friendly | capitalize }}.fulfilled, (state, action) => {
        state.loading = false
        state.list = state.list.filter(item => item._id !== action.payload)
      })
      .addCase(remove{{ table.singleName | friendly | capitalize }}.rejected, (state, action) => {
        state.loading = false
        state.error = action.payload as string
      })
  },
})

export const { resetState } = {{ table.name | friendly | lower }}Slice.actions
export default {{ table.name | friendly | lower }}Slice.reducer