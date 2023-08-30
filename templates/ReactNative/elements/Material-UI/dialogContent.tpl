/*
path: dialogContent.tpl
type: file
unique_id: WrV2SSGL
icon: ico-dialog-content
sourceType: javascript
children: []
*/
{% set bpr %}
import { Dialog } from 'react-native-paper'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Dialog.Content>{{ content | raw }}</Dialog.Content>