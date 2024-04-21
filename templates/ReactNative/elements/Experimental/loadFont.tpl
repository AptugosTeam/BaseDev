/*
path: loadFont.tpl
completePath: >-
  /Users/gastongorosterrazu/Aptugo/BaseDev/templates/ReactNative/elements/Experimental/loadFont.tpl
keyPath: elements/Experimental/loadFont.tpl
unique_id: nX9yXneu
extraFiles:
  - source: 'elements/Experimental/Fonts/fontawesome-webfont_solid.ttf'
    destination: 'front-end/assets/fontawesome-webfont_solid.ttf'
*/
{% set bpr %}
import { useFonts } from 'expo-font'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% set ph %}
useFonts({
  fontAwesome: require('@assets/fontawesome-webfont_solid.ttf')
})
{% endset %}
{{ save_delayed('ph',ph)}}