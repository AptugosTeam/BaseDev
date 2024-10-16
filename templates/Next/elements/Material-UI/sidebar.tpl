/*
path: sidebar.tpl
type: file
unique_id: nHTQpPfy
icon: ico-sidebar
sourceType: javascript
options:
  - name: open
    display: Open Variable
    type: text
    options: ''
  - name: handleOpen
    display: Open/Close handler
    type: text
    options: ''
extraFiles:
  - source: 'elements/Layout/Sidebar/Sidebar.tsx'
    destination: 'src/components/Sidebar/Sidebar.tsx'
  - source: 'elements/Layout/Sidebar/sidebar.module.scss'
    destination: 'src/components/Sidebar/sidebar.module.scss'
children: []
*/
{% set bpr %}
import Sidebar from '@components/Sidebar/Sidebar'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<Sidebar
  {% if element.values.handleOpen %}handleDrawerToggle={ {{ element.values.handleOpen }} }{% endif %}
  open={ {{ element.values.open }} }
>
{{ content | raw }}
</Sidebar>