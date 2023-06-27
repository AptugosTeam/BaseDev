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
  - name: showPlayPause
    display: Show Control - Play/Pause
    type: checkbox
    options: ''
  - name: showCurrentTime
    display: Show Control - Current Time
    type: checkbox
    options: ''
  - name: showProgress
    display: Show Control - Progress
    type: checkbox
    options: ''
  - name: showSeekBar
    display: Show Control - Seek Bar
    type: checkbox
    options: ''
  - name: showDuration
    display: Show Control - Duration
    type: checkbox
    options: ''
  - name: showMuteUnmute
    display: Show Control - Mute/Unmute
    type: checkbox
    options: ''
  - name: showVolume
    display: Show Control - Volume
    type: checkbox
    options: ''
  - name: showFullscreen
    display: Show Control - FullScreen
    type: checkbox
    options: ''
children: []
settings:
  - name: Packages
    value: '"react-player": "2.12.0",'
*/
{% set bpr %}
import ReactPlayer from 'react-player'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set ph %}
const { 
  {% if element.values.showPlayPause %}PlayPause,{% endif %}
  {% if element.values.showCurrentTime %}CurrentTime,{% endif %}
  Progress,
  SeekBar,
  Duration,
  MuteUnmute,
  Volume,
  Fullscreen 
} = controls
{% endset %}
{{ save_delayed('ph',ph) }}
<Media>
  <div className="media">
    <div className="media-player">
      <ReactPlayer url={{element.values.playVideo}} />
    </div>
    <div className="media-controls">
      {% if element.values.showPlayPause %}<PlayPause />{% endif %}
      {% if element.values.showCurrentTime %}<CurrentTime />{% endif %}
      {% if element.values.showProgress %}<Progress />{% endif %}
      {% if element.values.showSeekBar %}<SeekBar />{% endif %}
      {% if element.values.showDuration %}<Duration />{% endif %}
      {% if element.values.showMuteUnmute %}<MuteUnmute />{% endif %}
      {% if element.values.showVolume %}<Volume />{% endif %}
      {% if element.values.showFullscreen %}<Fullscreen />{% endif %}
    </div>
  </div>
</Media>