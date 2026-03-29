/*
path: AppState.tpl
completePath: >-
  /Users/Shared/Dev/BaseDev/Templates/ReactNative/elements/15_Programming/Snippets/AppState.tpl
keyPath: elements/15_Programming/Snippets/AppState.tpl
unique_id: n27XrLCL
options:
  - name: Async
    display: Async
    type: checkbox
    settings:
      default: false
  - name: storeInVariable
    display: store in variable?
    type: checkbox
    advanced: true
    settings:
      default: false
  - name: variableType
    display: Variable Type
    type: dropdown
    options: const;let;var;existing let
    advanced: true
    settings:
      propertyCondition: storeInVariable
      condition: true
  - name: variableName
    display: Variable Name
    type: text
    options: ''
    advanced: true
    settings:
      propertyCondition: storeInVariable
      condition: true
*/
{% set bpr %}
import { AppState } from 'react-native'
{% endset %}
{{save_delayed('bpr',bpr)}}
{% if element.values.storeInVariable %}{% if element.values.variableType == 'existing let' %}{{ element.values.variableName | default('appStateSubscription') }} = {% else %}{{ element.values.variableType | default('const') }} {{ element.values.variableName | default('appStateSubscription') }} = {% endif %}{% endif %}AppState.addEventListener('change', {% if element.values.Async %}async {% endif %}(nextAppState) => {
  {{ content | raw }}
})
