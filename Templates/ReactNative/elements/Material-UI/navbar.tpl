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
    type: text
    options: ''
  - name: Elevation
    display: Elevation
    type: dropdown
    options: 0;1;2;3;4;5
sourceType: javascript
children: []
*/
{% set bpr %}
import { Appbar } from 'react-native-paper';
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<Appbar>
  {{ content | raw }}
</Appbar>
