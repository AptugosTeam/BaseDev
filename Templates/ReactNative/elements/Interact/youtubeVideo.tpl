/*
path: youtubeVideo.tpl
keyPath: elements/Interact/youtubeVideo.tpl
unique_id: mDZain0m
helpText: Render a YouTube video player inside the app using a YouTube video ID
options:
  - name: videoID
    display: YouTube Video ID
    helpText: Identifier of the YouTube video to embed
    type: text
    options: ''
  - name: className
    display: ClassName
    type: styles
    options: ''
settings:
  - name: Packages
    value: '"react-native-youtube-iframe": "^2.3.0","react-native-webview": "13.15.0",'
*/
{% set bpr %}
import YoutubePlayer from "react-native-youtube-iframe"
{% endset %}
{{ save_delayed('bpr',bpr)}}
<YoutubePlayer
  height={300}
  videoId={ {{ element.values.videoID}} }
/>
