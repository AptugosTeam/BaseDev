/*
path: watchVariable.tpl
type: file
unique_id: UqzrPt4d
icon: ico-watch-variable
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
helpText: Watch a variable for changes
children: []
*/
{% if element.values.useCallback %}
React.useCallback(
{% else %}
React.useEffect(() => {
{% endif %}
  {{ content | raw }}
{% if not element.values.useCallback %} } {% endif %}
,[{{ element.values.watchVariable }}])