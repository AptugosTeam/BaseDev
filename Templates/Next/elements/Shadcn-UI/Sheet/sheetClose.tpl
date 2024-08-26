/*
path: sheetClose.tpl
completePath: elements/Shadcn-UI/Sheet/sheetClose.tpl
type: file
unique_id: SheetCloseAV
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
<SheetClose {% if element.values.asChild %}asChild{% endif %}>
{% if element.values.text %}{{element.values.text | textOrVariable}}{% endif %}
{{ content | raw }}
</SheetClose>
