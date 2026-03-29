/*
path: baseSlice.tsx
keyPath: elements/Programming/baseSlice.tsx
unique_id: baseSliceTplM4p8Ls
internalUse: true
*/
{% set sliceName = element.values.sliceName | default('custom') %}
{% set stateInterfaceName = element.values.stateInterfaceName | default(sliceName | friendly ~ 'State') %}
{% set sliceVariableName = element.values.sliceVariableName | default(sliceName ~ 'Slice') %}
import { createSlice, PayloadAction } from '@reduxjs/toolkit'
{% if element.values.extraImports %}
{{ element.values.extraImports | raw }}
{% endif %}

{% if element.values.thunksCode %}
{{ element.values.thunksCode | raw }}

{% endif %}
export interface {{ stateInterfaceName }} {
  {% if element.values.stateFields %}
  {{ element.values.stateFields | raw }}
  {% else %}
  data: any | null
  {% endif %}
}

const initialState: {{ stateInterfaceName }} = {
  {% if element.values.initialState %}
  {{ element.values.initialState | raw }}
  {% else %}
  data: null,
  {% endif %}
}

const {{ sliceVariableName }} = createSlice({
  name: '{{ sliceName }}',
  initialState,
  reducers: {
    {% if element.values.reducersCode %}
    {{ element.values.reducersCode | raw }}
    {% else %}
    setData: (state, action) => {
      state.data = action.payload
    },
    {% endif %}
  }{% if element.values.extraReducersCode %},
  extraReducers: (builder) => {
    {{ element.values.extraReducersCode | raw }}
  }{% endif %}
})

{% if element.values.actionsExportCode %}
{{ element.values.actionsExportCode | raw }}
{% elseif element.values.actionsToExport %}
export const { {{ element.values.actionsToExport }} } = {{ sliceVariableName }}.actions
{% elseif not element.values.reducersCode %}
export const { setData } = {{ sliceVariableName }}.actions
{% endif %}

{% if element.values.extraCodeBottom %}
{{ element.values.extraCodeBottom | raw }}

{% endif %}
export default {{ sliceVariableName }}.reducer
