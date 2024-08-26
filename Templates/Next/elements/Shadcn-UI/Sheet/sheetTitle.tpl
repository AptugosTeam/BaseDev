/*
path: sheetTitle.tpl
completePath: elements/Shadcn-UI/Sheet/sheetTitle.tpl
type: file
unique_id: SheetTitleAV
icon: f:ReactMediaPlayer.svg
options:
  - name: title
    display: Title
    type: text
    options: ''
children: []
*/
<SheetTitle>
{% if element.values.title %}{{element.values.title | textOrVariable}}{% endif %}
{{ content | raw }}
</SheetTitle>
