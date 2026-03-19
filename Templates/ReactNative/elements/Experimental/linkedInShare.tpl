/*
path: linkedInShare.tpl
type: file
unique_id: NCe9g0Jv
icon: ico-linkedin
helpText: 'Share on LinkedIn (use meta for content: og:title / og:image / og:description)'
sourceType: javascript
children: []
*/
{% set bpr %}
import { IconButton, Colors } from 'react-native-paper';
{% endset %}
{{ save_delayed('bpr',bpr) }}
<IconButton 
  icon="LinkedIn"
</IconButton>