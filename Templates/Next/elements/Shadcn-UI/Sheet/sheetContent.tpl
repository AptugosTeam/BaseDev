/*
path: sheetContent.tpl
completePath: elements/Shadcn-UI/Sheet/sheetContent.tpl
type: file
unique_id: SheetContAV
icon: f:ReactMediaPlayer.svg
options:
  - name: className
    display: ClassName
    type: styles
    options: ''
  - name: side
    display: Side
    type: dropdown
    options: 
      return [['top', 'Top'], ['right', 'Right'], ['bottom', 'Bottom'], ['left', 'Left']]
childs:
  - name:  Sheet Header
    element: sheetHeader
  - name:  Sheet Description
    element: sheetDescription
children: []
*/
<SheetContent
{% if element.values.className %}className={ {{element.values.className}} }{% endif %}
{% if element.values.side %}side="{{element.values.side}}"{% endif %}
>
{{ content | raw }}
</SheetContent>
