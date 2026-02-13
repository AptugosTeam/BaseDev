/*
path: switchFontFamily.tpl
keyPath: elements/Experimental/E-Books/switchFontFamily.tpl
unique_id: vWKgK8fA
*/
{% set bpr %}
  import { useReader } from '@epubjs-react-native/core'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% set ph %}const readerAccess = useReader(){% endset %}{{ save_delayed('ph',ph)}}
{% include includeTemplate('useState.tpl') with { 'element': { 'values': { variableName: 'currentFontFamily', defaultValue: 'availableFonts[0]' }}} %}
{% set bpr %}
const availableFonts: Array<string> = [
  'Helvetica',
  'cursive',
  'serif',
  'monospace',
  'Georgia',
  'Times',
];
{% endset %}
{{ save_delayed('bpr',bpr)}}
const switchFontFamily = () => {
  const index = availableFonts.indexOf(currentFontFamily)
  const nextFontFamily = availableFonts[(index + 1) % availableFonts.length]
  setcurrentFontFamily(nextFontFamily)
  readerAccess.changeFontFamily(nextFontFamily)
};