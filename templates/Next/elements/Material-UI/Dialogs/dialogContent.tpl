/*
path: dialogContent.tpl
completePath: elements/Material-UI/Dialogs/dialog.tpl
type: file
unique_id: WrV2SSGL
icon: ico-dialog-content
sourceType: javascript
children: []
options:
  - name: className
    display: Classname
    type: text
*/
{% set bpr %}
import DialogContent from '@mui/material/DialogContent'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<DialogContent {% if element.values.className %}className={ {{ element.values.className }} }{% endif %}>
{{ content | raw }}
</DialogContent>