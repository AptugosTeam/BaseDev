/*
path: sheetDescription.tpl
completePath: elements/Shadcn-UI/Sheet/sheetDescription.tpl
type: file
unique_id: SheetDescrAV
icon: f:ReactMediaPlayer.svg
options:
  - name: description
    display: Title
    type: text
    options: ''
children: []
*/
<SheetDescription>
{% if element.values.description %}{{element.values.description | textOrVariable}}{% endif %}
{{ content | raw }}
</SheetDescription>
