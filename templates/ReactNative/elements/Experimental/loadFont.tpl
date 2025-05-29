/*
path: loadFont.tpl
keyPath: elements/Experimental/loadFont.tpl
unique_id: nX9yXneu
options:
  - name: variableName
    display: Variable Name (Boolean Loaded Fonts)
    type: text
    options: ''
  - name: font
    display: Font
    type: hidden
    settings:
      aptugoOnLoad: |-
        let element = arguments[0]
        let fonts = aptugo.assetUtils.other()
          .filter(font => /\.(ttf|otf|woff|woff2)$/i.test(font.name))
          .map(font => font.name)
          .join(',')
        element.values.font = fonts
  - name: addAppJsonPlugins
    display: Add App Json Plugins
    type: checkbox
    options: ''
    advanced: true
settings:
  - name: Packages
    value: '"expo-font": "~11.4.0",'
*/
{% if element.values.addAppJsonPlugins %}
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
{% endif %}
{% set bpr %}
import { useFonts } from 'expo-font'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% set ph %}
{% if element.values.variableName %}
const [{{ element.values.variableName }}] ={% endif %} useFonts({
  {% set fontArray = element.values.font|split(',') %}
  {% for font in fontArray %}
    '{{- font|trim|split('.')|first -}}': require('@assets/{{ font|trim }}'){% if not loop.last %},{% endif %}
  {% endfor %}
})
{% endset %}
{{ save_delayed('ph',ph)}}