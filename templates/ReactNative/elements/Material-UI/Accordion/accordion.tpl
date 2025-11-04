/*
path: accordion.tpl
completePath: elements/Material-UI/Accordion/accordion.tpl
unique_id: WCeFNW3P
options:
  - name: title
    display: Title
    type: text
    options: ''
*/
{% set bpr %}
import { List } from 'react-native-paper'
{% endset %}
{{ save_delayed('bpr',bpr)}}
<List.Accordion title={{ element.values.title | textOrVariable }}>
  {{ content | raw}}
</List.Accordion>