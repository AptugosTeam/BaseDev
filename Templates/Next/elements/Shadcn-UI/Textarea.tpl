/*
path: Textarea.tpl
completePath: elements/Shadcn-UI/Textarea.tpl
type: file
unique_id: TextareaShadAV
icon: f:ReactMediaPlayer.svg
options:
  - name: value
    display: Value
    type: text
    options: ''
  - name: onChange
    display: On Change
    type: function
    options: ''
  - name: placeholder
    display: Placeholder
    type: text
    options: ''
  - name: className
    display: ClassName
    type: styles
    options: ''
  - name: DisableVariable
    display: Variable to disable input
    type: text
settings:
  - name: npmScripts
    value: '"add-textarea": "npx shadcn-ui@latest add textarea",'
children: []
*/
{% set bpr %}
import { Textarea } from "@/components/ui/textarea"
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Textarea 
{% if element.values.value %}value={{ element.values.value | textOrVariable }}{% endif%}
{% if element.values.placeholder %}placeholder={{ element.values.placeholder | textOrVariable }}{% endif%}
{% if element.values.className %}className={ {{ element.values.className }} }{% endif%}
{% if element.values.DisableVariable %}disabled={ {{ element.values.DisableVariable }} }{% endif %}
{% if element.values.onChange %}onChange={ {{ element.values.onChange | functionOrCall }} }{% endif %}
>
{{ content | raw }}
</Textarea>
