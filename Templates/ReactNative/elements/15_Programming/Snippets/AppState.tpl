/*
path: AppState.tpl
completePath: >-
  /Users/Shared/Dev/BaseDev/Templates/ReactNative/elements/15_Programming/Snippets/AppState.tpl
keyPath: elements/15_Programming/Snippets/AppState.tpl
unique_id: n27XrLCL
*/
{% set bpr %}
import { AppState } from 'react-native'
{% endset %}
{{save_delayed('bpr',bpr)}}
let appState = AppState.currentState
AppState.addEventListener('change', (nextAppState) => {
  {{ content | raw }}
})