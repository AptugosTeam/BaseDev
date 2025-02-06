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
helpText: Watch a variable for changes
children: []
*/

{% set ph %}
React.useEffect(() => {
    {{ content | raw }}
},[{{ element.values.watchVariable }}])
{% endset %}
{{ save_delayed('ph',ph) }}