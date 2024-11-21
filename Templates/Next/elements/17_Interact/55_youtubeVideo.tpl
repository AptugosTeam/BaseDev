/*
path: youtubeVideo.tpl
keyPath: elements/Interact/youtubeVideo.tpl
icon: ico-youtube
unique_id: mDZain0m
order: 55
name: YouTube Video
options:
  - name: videoID
    display: YouTube Video ID
    type: text
    options: ''
  - name: className
    display: ClassName
    type: styles
    options: ''
settings:
  - name: Packages
    value: '"react-youtube": "^10.1.0",'
*/
{% set bpr %}
import YouTube from 'react-youtube'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% if element.values.className %}<div className={ {{element.values.className|raw}} }>{% endif %}
<YouTube videoId={{ element.values.videoID | textOrVariable }}/>
{% if element.values.className %}</div>{% endif %}