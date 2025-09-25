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
  - name: onStateChange
    display: onStateChange
    type: function
    options: ''
settings:
  - name: Packages
    value: '"react-youtube": "^10.1.0",'
*/
{% set bpr %}
import YouTube from 'react-youtube'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<YouTube videoId={{ element.values.videoID | textOrVariable }}
  {% if element.values.className %}
    className={ {{element.values.className}} }
  {% endif %}
{% if element.values.onStateChange %}
  onStateChange={(state) => {
    {{ element.values.onStateChange }}
  }}
{% endif %}
/>