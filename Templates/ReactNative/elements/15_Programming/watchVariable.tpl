/*
path: watchVariable.tpl
type: file
unique_id: UqzrPt4d
icon: ico-watch
options:
  - name: watchVariable
    display: Variable to Watch
    type: text
    options: ''
  - name: useMemo
    display: Use Memo instead of Use Effect
    type: checkbox
  - name: useCallback
    display: Use Callback instead of Use Effect
    type: checkbox
  - name: useFocusEffect
    display: Change on focus effect as well
    type: checkbox
helpText: Watch a variable for changes
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