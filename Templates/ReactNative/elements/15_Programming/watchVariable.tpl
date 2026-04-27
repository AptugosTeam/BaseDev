/*
path: watchVariable.tpl
type: file
unique_id: UqzrPt4d
icon: ico-watch
helpText: Run code whenever a watched variable changes, optionally using focus-aware or memoized React patterns
options:
  - name: watchVariable
    display: Variable to Watch
    helpText: Dependency expression observed by the generated effect or callback
    type: text
    options: ''
  - name: useMemo
    display: Use Memo instead of Use Effect
    helpText: Reserved editor option indicating a memoized pattern instead of a standard effect
    type: checkbox
  - name: useCallback
    display: Use Callback instead of Use Effect
    helpText: Generate React.useCallback instead of React.useEffect for the watched logic
    type: checkbox
  - name: useFocusEffect
    display: Change on focus effect as well
    helpText: Wrap the watcher in useFocusEffect so it also reacts when the screen gains focus
    type: checkbox
children: []
*/
{% if element.values.useFocusEffect %}
{% set bpr %}import { useFocusEffect } from '@react-navigation/native'{% endset %}{{ save_delayed('bpr',bpr)}}
useFocusEffect(
{% endif %}
{% if element.values.useCallback %}
React.useCallback(() => {
{% else %}
React.useEffect(() => {
{% endif %}
  {{ content | raw }}
}
,[{{ element.values.watchVariable }}])
{% if element.values.useFocusEffect %}
)
{% endif %}
