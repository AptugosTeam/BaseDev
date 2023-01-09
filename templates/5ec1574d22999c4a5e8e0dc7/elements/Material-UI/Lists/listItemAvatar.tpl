/*
path: listItemAvatar.tpl
completePath: elements/Material-UI/Lists/listAvatar.tpl
type: file
unique_id: UiCt6mqz
icon: f:icoListItemAvatar.svg
sourceType: javascript
children: []
options:
  - name: path
    display: Image Path
    type: text
    options: ''
*/
{% set bpr %}
import ListItemAvatar from '@mui/material/ListItemAvatar'
import Avatar from '@mui/material/Avatar'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<ListItemAvatar>
{% if element.values.path %}
  <Avatar
    src={{ element.values.path|textOrVariable }}
  /> 
{% else %}
  <Avatar>{{ content | raw }}</Avatar> 
{% endif %}
</ListItemAvatar>