/*
path: useCallback.tpl
type: file
unique_id: useCallback
icon: ico-watch-variable
options:
  - name: functionName
    display: Function Name
    type: text
    options: ''
  - name: watchVariable
    display: Variable to Watch
    type: text
    options: ''
  - name: callbackParams
    display: Callback Parameters
    type: text
    options: ''
helpText: Memoizes a callback function that only changes when its dependencies change, using React.useCallback. You can specify parameters for the callback and the function name.
children: []
*/

{% set params = element.values.callbackParams | default('') %}
{% set functionName = element.values.functionName | default('AptugoCallback') %}
{% set ph %}
const {{ functionName }} = React.useCallback(({{ params }}) => {
    {{ content | raw }}
},[{{ element.values.watchVariable }}])
{% endset %}
{{ save_delayed('ph',ph) }}