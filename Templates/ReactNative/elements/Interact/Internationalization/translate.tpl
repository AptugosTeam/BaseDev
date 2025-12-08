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
*/
{% set bpr %}import { useTranslation } from 'react-i18next'{% endset %}{{ save_delayed('bpr',bpr)}}
{% set bpr %}import { Text } from 'react-native'{% endset %}{{ save_delayed('bpr',bpr)}}
{% set ph %}const { t } = useTranslation(){% endset %}{{ save_delayed('ph',ph)}}
{% if element.values.text %}
  <Text numberOfLines={ {{ element.values.lines|default(1) }} } adjustsFontSizeToFit {% if element.values.className %}style={ {{ element.values.className }} }{% endif %}>{t({{ element.values.text | textOrVariableInCode }})}</Text>
{% else %}
  {t({{ content|raw }})}
{% endif %}
