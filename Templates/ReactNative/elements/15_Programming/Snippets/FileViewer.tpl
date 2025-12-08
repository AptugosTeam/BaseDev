/*
path: FileViewer.tpl
keyPath: elements/15_Programming/Snippets/FileViewer.tpl
unique_id: 9uZUb4wD
options:
  - name: uri
    display: File URI
    type: text
settings:
  - name: Packages
    value: '"react-native-file-viewer": "^2.1.5",'
*/
{% set bpr %}
import FileViewer from "react-native-file-viewer"
{% endset %}
{{ save_delayed('bpr',bpr)}}
await FileViewer.open({{ element.values.uri | textOrVariableInCode }}, {
  showOpenWithDialog: false,
  {% if element.children %}onDismiss: () => {
    {{ content | raw }}
  }
  {% endif %}
})