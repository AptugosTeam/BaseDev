/*
path: sidebar.tpl
type: file
unique_id: nHTQpPfy
icon: ico-sidebar
sourceType: javascript
options:
  - name: colorSchema
    display: Color Schema
    type: dropdown
    options: Greens;Red;Blue;Black;Cyan
  - name: open
    display: Open Variable
    type: text
    options: ''
  - name: handleOpen
    display: Open/Close handler
    type: text
    options: ''
children: []
*/

{% set bpr %}
import Sidebar from '../components/Sidebar/Sidebar'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<Sidebar
    color='{{ element.values.colorSchema }}'
    {% if element.values.handleOpen %}handleDrawerToggle={ {{ element.values.handleOpen }} }{% endif %}
    open={ {{ element.values.open }} }
>
{{ content | raw }}
</Sidebar>