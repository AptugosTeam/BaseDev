/*
path: navbar.tpl
type: file
unique_id: DgXmELX2
icon: ico-nav-bar
helpText: Navigation bar component
options:
  - name: Title
    display: Title
    type: text
    options: ''
  - name: Color
    display: Color
    type: dropdown
    options: default;inherit;primary;secondary;transparent
  - name: Position
    display: Position
    type: dropdown
    options: absolute;fixed;relative;static;sticky
  - name: ClassName
    display: ClassName
    type: styles
    options: ''
  - name: Elevation
    display: Elevation
    type: dropdown
    options: 0;1;2;3;4;5
sourceType: javascript
children: []
*/
{% set bpr %}
import AppBar from '@mui/material/AppBar'
import Toolbar from '@mui/material/Toolbar'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<AppBar
    elevation={ {{ element.values.Elevation|default('0') }} }
    {% if element.values.Color %}color='{{ element.values.Color }}'{% endif %}
    {% if element.values.Position %}position='{{ element.values.Position }}'{% endif %}
    title='{{ element.values.Title }}'
>
<Toolbar {% if element.values.ClassName %}className={ {{ element.values.ClassName }} }{% endif %}>
{{ content | raw }}
</Toolbar>
</AppBar>
