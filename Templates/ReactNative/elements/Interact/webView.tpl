/*
path: webView.tpl
keyPath: elements/Interact/webView.tpl
unique_id: mDZain0p
options:
  - name: uri
    display: URI
    type: text
    options: ''
  - name: className
    display: ClassName
    type: text
    options: ''
settings:
  - name: Packages
    value: '"react-native-webview": "13.15.0",'
*/
{% set bpr %}
import WebView from 'react-native-webview'
{% endset %}
{{ save_delayed('bpr',bpr)}}
<WebView
  {% if element.values.className %}style={ {{element.values.className}} }{% endif %}
  source={ { uri: `{{ element.values.uri }}` } }
  javaScriptEnabled={true}
  allowsInlineMediaPlayback={true}
/>