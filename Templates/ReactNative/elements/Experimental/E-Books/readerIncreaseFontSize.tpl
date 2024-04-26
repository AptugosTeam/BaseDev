/*
path: readerIncreaseFontSize.tpl
keyPath: elements/Experimental/E-Books/readerIncreaseFontSize.tpl
unique_id: 8hueurER
options:
  - name: defaultFontSize
    display: Default Font Size
    type: text
    options: ''
    settings:
      default: '16'
      active: true
  - name: maxFontSize
    display: MAX Font Size
    type: text
    options: ''
    settings:
      default: '32'
      active: true
*/
{% set bpr %}
  import { useReader } from '@epubjs-react-native/core'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% set ph %}const readerAccess = useReader(){% endset %}{{ save_delayed('ph',ph)}}
{% include includeTemplate('useState.tpl') with { 'element': { 'values': { variableName: 'currentFontSize', defaultValue: element.values.defaultFontSize|default('14') }}} %}
const increaseFontSize = () => {
  if (currentFontSize < {{ element.values.maxFontSize|default('32')}}) {
    setcurrentFontSize(currentFontSize + 1)
    readerAccess.changeFontSize(`${currentFontSize + 1}px`)
  }
}