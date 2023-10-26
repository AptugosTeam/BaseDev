/*
path: ReactMediaPlayer.tpl
completePath: elements/Experimental/ReactMediaPlayer.tpl
type: file
unique_id: ReactMediaPlayer
icon: f:ReactMediaPlayer.svg
options:
  - name: playVideo
    display: Video URL to play
    type: text
    options: ''
  - name: controls
    display: Show Video controls
    type: checkbox
    settings:
      default: false
    options: ''
  - name: playing
    display: Autoplay video
    type: checkbox
    settings:
      default: false
    options: ''
  - name: loop
    display: Loop the Video
    type: checkbox
    settings:
      default: false
    options: ''
  - name: muted
    display: Muted video
    type: checkbox
    settings:
      default: false
    options: ''
  - name: width
    display: Video width (in PX or %)
    type: text
    options: ''
  - name: height
    display: Video height (in PX or %)
    type: text
    options: ''
children: []
settings:
  - name: Packages
    value: '"react-player": "2.13.0",'
*/
{% set bpr %}
import ReactPlayer from 'react-player'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set ph %}
{% endset %}
{{ save_delayed('ph',ph) }}
<div className="media-player">
  <ReactPlayer 
    url='{{ element.values.playVideo }}'
    {% if element.values.controls %}
      controls={true} 
    {% endif %}
    {% if element.values.playing %}
      playing 
    {% endif %}
    {% if element.values.loop %}
      loop={true} 
    {% endif %}
    {% if element.values.muted %}
      muted={true} 
    {% endif %}
    {% if element.values.width %}
      width='{{ element.values.width }}' 
    {% endif %}
    {% if element.values.height %}
      height='{{ element.values.height }}' 
    {% endif %}
  />
</div>
