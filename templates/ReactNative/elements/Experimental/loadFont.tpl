/*
path: loadFont.tpl
keyPath: elements/Experimental/loadFont.tpl
unique_id: nX9yXneu
options:
  - name: font
    display: Font
    type: hidden
    settings:
      aptugoOnLoad: |-
        element = arguments[0]
        const fonts = aptugo.assetUtils.other()
          .filter(font => /\.(ttf|otf|woff|woff2)$/i.test(font.name))
          .map(font => font.name)
          .join(',')
        element.values.font = fonts
settings:
  - name: Packages
    value: '"expo-font": "~11.10.3",'
*/

{% set AppJsonPlugins %}
[
  "expo-font",
  {
    "fonts": {
        {% set fontArray = element.values.font|split(',') %}
        {% for font in fontArray %}
        '{{font | removeExtension}}': './assets/{{ font|trim }}'{% if not loop.last %},{% endif %}
        {% endfor %}
    }
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