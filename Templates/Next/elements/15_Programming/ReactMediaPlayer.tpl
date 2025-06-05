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
  - name: playVideoDB
    display: Video database URL to play
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
  - name: customPlaying
    display: Set custom variable for playing
    type: text
    settings:
      propertyCondition: playing
      condition: customPlaying
      active: true
  - name: playsinline
    display: playsinline 
    type: checkbox
    settings:
      default: false
    options: ''
    advanced: true
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
  - name: customMuted
    display: Set custom variable for Muted
    type: text
    settings:
      propertyCondition: muted
      condition: customMuted
      active: true
  - name: width
    display: Video width (in PX or %)
    type: text
    options: ''
  - name: height
    display: Video height (in PX or %)
    type: text
    options: ''
  - name: playlist
    display: URLs for Playlist 
    type: checkbox
    settings:
      default: false
    options: ''
    advanced: true
  - name: playlistArray
    display: URLs for Playlist Arrays
    type: text
    options: ''
    advanced: true
    settings:
      condition: true
      propertyCondition: playlist
  - name: onReady
    display: Action to trigger when component is loaded
    type: function
    options: ''
    advanced: true
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
    {% if element.values.playVideoDB %}
      url={ {{ element.values.playVideoDB }} }
    {% else %}
      {% if element.values.playlist and element.values.playlistArray %}
      url={ {{ element.values.playlistArray }} }
      {% else %}
      url='{{ element.values.playVideo }}'
      {% endif %}
    {% endif %}
    {% if element.values.controls %}
      controls={true} 
    {% endif %}
    {% if element.values.playsinline %}
      playsinline 
    {% endif %}
    {% if element.values.playing and not element.values.customPlaying %}
      playing
    {% endif %}
    {% if element.values.playing and element.values.customPlaying %}
      playing={ {{element.values.customPlaying}} }
    {% endif %}
    {% if element.values.loop %}
      loop={true} 
    {% endif %}
    {% if element.values.muted and not element.values.customMuted %}
      muted={true} 
    {% endif %}
    {% if element.values.muted and element.values.customMuted %}
      muted={ {{element.values.customMuted}} }
    {% endif %}
    {% if element.values.width %}
      width='{{ element.values.width }}' 
    {% endif %}
    {% if element.values.height %}
      height='{{ element.values.height }}' 
    {% endif %}
    {% if element.values.onReady %}
      onReady={ {{element.values.onReady}} }
    {% endif %}
  />
</div>
