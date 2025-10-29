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
  - name: height
    display: height
    type: text
    options: ''
settings:
  - name: Packages
    value: '"react-native-youtube-iframe": "^2.3.0","react-native-webview": "13.2.2",'
*/
{% set bpr %}
import YoutubePlayer from "react-native-youtube-iframe"
{% endset %}
{{ save_delayed('bpr',bpr)}}
<YoutubePlayer
  height={ {{ element.values.height}} }
  videoId={ {{ element.values.videoID}} }
/>