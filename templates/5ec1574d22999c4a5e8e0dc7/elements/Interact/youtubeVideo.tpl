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
*/
{% set uri = "https://www.youtube.com/embed/" ~ element.values.videoID ~ "?rel=0&autoplay=0&showinfo=0&controls=0" %}
<iframe
  {% if element.values.className %}style={ {{element.values.className}} }{% endif %}
  source={uri}
  javaScriptEnabled={true}
/>