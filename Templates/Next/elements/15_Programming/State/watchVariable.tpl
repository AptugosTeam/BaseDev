/*
path: watchVariable.tpl
display: Watch a variable
type: file
unique_id: UqzrPt4d
icon: ico-watch
helpText: Runs the child code when the watched dependencies change. Default is useEffect. Enable Use Memo for computed values returned from the block, or Use Callback for reusable handlers/functions.
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
children: []
*/
{% if element.values.useCallback %}
React.useCallback(() => {
{% elseif element.values.useMemo %}
React.useMemo(() => {
{% else %}
React.useEffect(() => {
{% endif %}
  {{ content | raw }}
}
,[{{ element.values.watchVariable }}])
