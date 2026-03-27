/*
path: slice.tpl
keyPath: elements/Programming/Redux/slice.tpl
unique_id: sliceTplK9m2Qa
icon: ico-component
order: 5
helpText: >-
  Creates a Redux Toolkit slice file with sensible defaults and free-form code
  blocks for imports, thunks, reducers, and extra reducers.
options:
  - name: sliceName
    display: Slice Name
    type: text
    options: ''
    settings:
      default: custom
  - name: fileName
    display: File Name
    type: text
    options: ''
    settings:
      default: customSlice
  - name: storeKey
    display: Store Key
    type: text
    options: ''
    settings:
      default: custom
  - name: stateInterfaceName
    display: State Interface Name
    type: text
    options: ''
    advanced: true
  - name: sliceVariableName
    display: Slice Variable Name
    type: text
    options: ''
    advanced: true
  - name: reducerImportName
    display: Reducer Import Name
    type: text
    options: ''
    advanced: true
  - name: extraImports
    display: Extra Imports
    type: code
    options: ''
    advanced: true
  - name: stateFields
    display: State Interface Fields
    type: code
    options: ''
  - name: initialState
    display: Initial State
    type: code
    options: ''
  - name: thunksCode
    display: Thunks / Helpers
    type: code
    options: ''
    advanced: true
  - name: reducersCode
    display: Reducers Code
    type: code
    options: ''
  - name: extraReducersCode
    display: Extra Reducers Code
    type: code
    options: ''
    advanced: true
  - name: actionsToExport
    display: Actions To Export
    type: text
    options: ''
    advanced: true
  - name: actionsExportCode
    display: Custom Actions Export
    type: code
    options: ''
    advanced: true
  - name: extraCodeBottom
    display: Extra Code At Bottom
    type: code
    options: ''
    advanced: true
extraFiles:
  - source: 'elements/99_ExtraFiles/baseSlice.tsx'
    destination: 'front-end/store/slices/{{ element.values.fileName | default(element.values.sliceName | default("custom") ~ "Slice") | friendly }}.tsx'
*/
{% set sliceName = element.values.sliceName | default('custom') %}
{% set safeFileName = element.values.fileName | default(sliceName ~ 'Slice') | friendly %}
{% set storeKey = element.values.storeKey | default(sliceName) %}
{% set reducerImportName = element.values.reducerImportName | default(safeFileName ~ 'Reducer') %}

{% set storeImport %}import {{ reducerImportName }} from './slices/{{ safeFileName }}'{% endset %}
{{ add_setting('StoreImports', storeImport) }}

{% set storeReducer %}{{ storeKey }}: {{ reducerImportName }},{% endset %}
{{ add_setting('StoreReducers', storeReducer) }}
