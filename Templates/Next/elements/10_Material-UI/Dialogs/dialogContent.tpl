/*
path: dialogContent.tpl
completePath: elements/Material-UI/Dialogs/dialog.tpl
type: file
unique_id: WrV2SSGL
icon: ico-dialog-content
sourceType: javascript
children: []
*/
{% set bpr %}
import DialogContent from '@mui/material/DialogContent'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<DialogContent>{{ content | raw }}</DialogContent>