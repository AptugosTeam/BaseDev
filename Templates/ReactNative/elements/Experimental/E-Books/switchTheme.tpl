/*
path: switchTheme.tpl
keyPath: elements/Experimental/E-Books/switchTheme.tpl
unique_id: sN1LGVW7
*/
{% set bpr %}
  import { Themes } from '@epubjs-react-native/core'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% set ph %}const readerAccess = useReader(){% endset %}{{ save_delayed('ph',ph)}}
const switchTheme = () => {
  const themes = Object.values(Themes)
  let index = Object.values(themes).indexOf(readerAccess.theme)
  const nextTheme = Object.values(themes)[(index + 1) % Object.values(themes).length]
  readerAccess.changeTheme(nextTheme)
}