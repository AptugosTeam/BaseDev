/*
path: translate.tpl
keyPath: elements/15_Programming/Snippets/translate.tpl
unique_id: x1VTiUTp
helpText: Translate a key with i18next and render it as text or return only the translated value
options:
  - name: text
    display: Text
    helpText: Translation key or expression to resolve through i18next
    type: text
  - name: className
    display: ClassName
    type: styles
    options: ''
  - name: lines
    display: Display lines
    helpText: Maximum number of lines to render before truncating the text
    type: text
    settings:
      default: 1
  - name: justtranslate
    display: Render just the value
    helpText: Return only the translated value instead of wrapping it in a Text component
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
