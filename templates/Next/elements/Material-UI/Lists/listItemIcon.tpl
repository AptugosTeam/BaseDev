/*
path: listItemIcon.tpl
completePath: elements/Material-UI/Lists/listItemIcon.tpl
type: file
unique_id: UiCt6mic
icon: f:listItemAvatar.svg
sourceType: javascript
children: []
*/
{% set bpr %}
import ListItemIcon from '@mui/material/ListItemIcon'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<ListItemIcon>{{ content | raw }}</ListItemIcon>