/*
path: loadFont.tpl
keyPath: elements/Experimental/loadFont.tpl
unique_id: nX9yXneu
options:
  - name: font
    display: Font
    type: dropdown
    options: |-
      return [
        ['fontawesome-webfont_solid.ttf','Font Awesome'],
        ['Roboto-Medium.ttf','Roboto'],
        ['Quicksand-Light.ttf','Quicksand Light'],
        ['Quicksand-Bold.ttf','Quicksand Bold']
      ]
settings:
  - name: Packages
    value: '"expo-font": "~11.10.3",'
*/
{% set AppJsonPlugins %}
[
  "expo-font",
  {
    "fonts": ["assets/{{ element.values.font | default('fontawesome-webfont_solid.ttf') }}"]
  }
],
{% endset %}
{{ add_setting('AppJsonPlugins', AppJsonPlugins)}}
{% 
  set fontNames = {
    'fontawesome-webfont_solid.ttf': 'fontAwesome',
    'Roboto-Medium.ttf': 'Roboto',
    'Quicksand-Bold.ttf': 'Quicksand-Bold'
  }
%}
{% set bpr %}
import { useFonts } from 'expo-font'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% set ph %}
useFonts({
  '{{ fontNames[element.values.font] }}': require('@assets/{{ element.values.font | default('fontawesome-webfont_solid.ttf') }}'),
})
{% endset %}
{{ save_delayed('ph',ph)}}