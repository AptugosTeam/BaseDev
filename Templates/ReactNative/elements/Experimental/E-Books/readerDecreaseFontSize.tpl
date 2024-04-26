/*
path: readerDecreaseFontSize.tpl
keyPath: elements/Experimental/E-Books/readerDecreaseFontSize.tpl
unique_id: 8hueurRE
options:
  - name: defaultFontSize
    display: Default Font Size
    type: text
    options: ''
    settings:
      default: '16'
      active: true
  - name: minFontSize
    display: MIN Font Size
    type: text
    options: ''
    settings:
      default: '8'
      active: true
*/
{% set bpr %}
  import { useReader } from '@epubjs-react-native/core'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% set ph %}const readerAccess = useReader(){% endset %}{{ save_delayed('ph',ph)}}
{% include includeTemplate('useState.tpl') with { 'element': { 'values': { variableName: 'currentFontSize', defaultValue: element.values.defaultFontSize|default('14') }}} %}
const decreaseFontSize = () => {
  if (currentFontSize > {{ element.values.minFontSize|default('8')}}) {
    setcurrentFontSize(currentFontSize - 1)
    readerAccess.changeFontSize(`${currentFontSize - 1}px`)
  }
}

