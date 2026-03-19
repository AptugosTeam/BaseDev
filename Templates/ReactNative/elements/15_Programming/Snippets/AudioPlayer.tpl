/*
path: AudioPlayer.tpl
keyPath: elements/15_Programming/Snippets/AudioPlayer.tpl
unique_id: e0EnhTpz
options:
  - name: AudioFile
    display: Audio file to play
    type: text
  - name: playerVar
    display: Name of the Player Variable
    type: text
    settings:
      default: 'player'
  - name: delay
    display: Delay in seconds before playinh
    type: text
settings:
  - name: Packages
    value: '"expo-audio": "~1.1.1",'
*/
{% set bpr %}
import { useAudioPlayer } from 'expo-audio'
{% endset %}
{{save_delayed('bpr',bpr)}}
{% set varName = element.values.playerVar|default('player') %}
{% set ph %}
const {{ varName }} = useAudioPlayer(require('@assets/audio/{{ element.values.AudioFile }}'))
{% endset %}
{{ save_delayed('ph',ph)}}
{% if element.values.delay %}setTimeout(() => { {% endif %}
  {{ varName }}.play()
{% if element.values.delay %} }, {{ element.values.delay }}000){% endif %}