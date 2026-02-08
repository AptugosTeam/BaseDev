/*
path: translate.tpl
keyPath: elements/15_Programming/Snippets/translate.tpl
unique_id: x1VTiUTp
options:
  - name: text
    display: Text
    type: text
  - name: className
    display: ClassName
    type: text
    options: ''
  - name: lines
    display: Display lines
    type: text
    settings:
      default: 1
  - name: justtranslate
    display: Render just the value
    type: checkbox
    options: ''
    settings:
      value: 'false'
*/
{% set bpr %}import { useTranslation } from 'react-i18next'{% endset %}{{ save_delayed('bpr',bpr)}}
{% set bpr %}import { Text } from 'react-native'{% endset %}{{ save_delayed('bpr',bpr)}}
{% set ph %}const { t } = useTranslation(){% endset %}{{ save_delayed('ph',ph)}}
{% if element.values.text %}
  {% if not element.values.justtranslate %}<Text numberOfLines={ {{ element.values.lines|default(1) }} } adjustsFontSizeToFit {% if element.values.className %}style={ {{ element.values.className }} }{% endif %}>{ {% endif %}
  t({{ element.values.text | textOrVariableInCode }})
  {% if not element.values.justtranslate %} }</Text>{% endif %}
{% else %}
  {t({{ content|raw }})}
{% endif %}
