/*
path: sheet.tpl
completePath: elements/Shadcn-UI/Sheet/sheet.tpl
type: file
unique_id: SheetShadAV
icon: f:ReactMediaPlayer.svg
options:
settings:
  - name: npmScripts
    value: '"add-sheet": "npx shadcn-ui@latest add sheet",'
  - name: Packages
    value: '"@radix-ui/react-dialog": "^1.1.1",
    "class-variance-authority": "^0.7.0",
    "tailwind-merge": "^2.5.2",
    "@radix-ui/react-icons": "^1.3.0",'
childs:
  - name:  Sheet Trigger
    element: sheetTrigger
  - name:  Sheet Content
    element: sheetContent
children: []
*/
{% set bpr %}
import {
  Sheet,
  SheetContent,
  SheetDescription,
  SheetHeader,
  SheetTitle,
  SheetTrigger,
  SheetClose
} from "@/components/ui/sheet"
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Sheet>
{{ content | raw }}
</Sheet>
