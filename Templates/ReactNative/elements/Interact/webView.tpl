/*
path: webView.tpl
keyPath: elements/Interact/webView.tpl
unique_id: mDZain0p
helpText: Embed external web content inside the app using React Native WebView
options:
  - name: uri
    display: URI
    helpText: Remote URL to load inside the embedded web view
    type: text
    options: ''
  - name: className
    display: ClassName
    helpText: Style object applied to the WebView component
    type: styles
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
