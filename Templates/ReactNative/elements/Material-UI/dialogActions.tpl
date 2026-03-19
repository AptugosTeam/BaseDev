/*
path: dialogActions.tpl
type: file
unique_id: LRTdiJMk
icon: ico-dialog-actions
children: []
*/
{% set bpr %}
import { Dialog } from 'react-native-paper'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Dialog.Actions>{{ content | raw }}</Dialog.Actions>