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
<div className={theme.sideBar}>{{ content | raw }}</div>