/*
path: sheetTrigger.tpl
completePath: elements/Shadcn-UI/Sheet/sheetTrigger.tpl
type: file
unique_id: SheetTrigAV
icon: f:ReactMediaPlayer.svg
options:
  - name: text
    display: Text
    type: text
    options: ''
  - name: asChild
    display: As Child?
    type: checkbox
    options: ''
    settings:
      default: false
*/
<SheetTrigger {% if element.values.asChild %}asChild{% endif %}>
{% if element.values.text %}{{element.values.text | textOrVariable}}{% endif %}
{{ content | raw }}
</SheetTrigger>
