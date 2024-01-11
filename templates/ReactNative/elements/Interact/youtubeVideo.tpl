/*
path: youtubeVideo.tpl
keyPath: elements/Interact/youtubeVideo.tpl
unique_id: mDZain0m
options:
  - name: videoID
    display: YouTube Video ID
    type: text
    options: ''
  - name: className
    display: ClassName
    type: text
    options: ''
settings:
  - name: Packages
    value: '"react-native-webview": "13.2.2",'
*/
{% set bpr %}
import WebView from 'react-native-webview'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% set uri = "https://www.youtube.com/embed/" ~ element.values.videoID ~ "?rel=0&autoplay=0&showinfo=0&controls=0" %}
<WebView
  {% if element.values.className %}style={ {{element.values.className}} }{% endif %}
  source={ { uri: `{{ uri }}` } }
  javaScriptEnabled={true}
/>