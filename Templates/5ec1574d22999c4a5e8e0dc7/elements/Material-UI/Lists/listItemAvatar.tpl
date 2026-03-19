/*
path: listItemAvatar.tpl
completePath: elements/Material-UI/Lists/listAvatar.tpl
type: file
unique_id: UiCt6mqz
icon: f:listItemAvatar.svg
sourceType: javascript
children: []
options:
  - name: useAsset
    display: Use an asset
    type: dropdown
    options: >-
      return [['none', 'none'],
      ...aptugo.assetUtils.images().map(image => [image.id, image.name])]
  - name: path
    display: Image Path
    type: text
    options: ''
*/
{% set path = element.values.path %}
{% if element.values.useAsset and element.values.useAsset != 'none' %}
  {% set asset = element.values.useAsset|assetData %}
  {% set path = '/img/' ~ asset.name %}
{% endif %}
{% set bpr %}
import ListItemAvatar from '@mui/material/ListItemAvatar'
import Avatar from '@mui/material/Avatar'
{% endset %}
{{ save_delayed('bpr',bpr) }}

<ListItemAvatar>
  <Avatar
    {% if path %}
    src={{ path|textOrVariable }}
    {% endif %}
  />
</ListItemAvatar>