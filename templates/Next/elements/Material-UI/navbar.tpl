/*
path: navbar.tpl
type: file
unique_id: DgXmELX2
icon: ico-nav-bar
helpText: Navigation bar component
options:
  - name: ClassName
    display: ClassName
    type: styles
    options: ''
sourceType: javascript
children: []
*/
<header {% if element.values.ClassName %}className={ {{ element.values.ClassName }} }{% endif %}>
  {{ content | raw }}
</header>
