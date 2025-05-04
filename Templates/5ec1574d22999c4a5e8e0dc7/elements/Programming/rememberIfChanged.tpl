/*
path: rememberIfChanged.tpl
type: file
unique_id: UpfzPt9o
icon: ico-watch-variable
options:
  - name: name
    display: Variable Name
    type: text
    options: ''
  - name: rememberIfChanged
    display: Variable to Watch
    type: text
    options: ''
  - name: contentCode
    display: Content
    type: code
    options: ''
helpText: This block recalculates its value only when the inputs change. Ideal for expensive computations.
children: []
*/


{% if element.values.name %} 
  const {{ element.values.name | raw }} 
{% else %} 
  const rememberIfChanged 
{% endif %} = React.useMemo(() => {
   {% if element.values.contentCode %}
    {{ element.values.contentCode | raw }}
  {% endif %}
    {{ content | raw }}
},[{{ element.values.rememberIfChanged }}])
