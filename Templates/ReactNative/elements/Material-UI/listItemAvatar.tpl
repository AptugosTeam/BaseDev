/*
path: listItemAvatar.tpl
type: file
unique_id: UiCt6mqz
icon: ico-list-item
sourceType: javascript
children: []
*/
{% set bpr %}
import ListItemAvatar from '@mui/material/ListItemAvatar'
import Avatar from '@mui/material/Avatar'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<ListItemAvatar>
    <Avatar
        src='/img/logo.png'
    />
</ListItemAvatar>