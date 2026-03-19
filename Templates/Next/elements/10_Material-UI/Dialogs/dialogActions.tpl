/*
path: dialogActions.tpl
completePath: elements/Material-UI/Dialogs/dialog.tpl
type: file
unique_id: LRTdiJMk
icon: ico-dialog-actions
children: []
*/
{% set bpr %}
import DialogActions from '@mui/material/DialogActions'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<DialogActions>{{ content | raw }}</DialogActions>