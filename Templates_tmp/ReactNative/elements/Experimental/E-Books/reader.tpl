/*
path: reader.tpl
keyPath: elements/Experimental/E-Books/reader.tpl
unique_id: spyi1tTp
options:
  - name: document
    display: Document Path
    type: text
settings:
  - name: Packages
    value: '"@epubjs-react-native/core": "^1.4.1","@epubjs-react-native/expo-file-system": "^1.1.3",'
*/
{% set SWAI %}import { ReaderProvider } from '@epubjs-react-native/core'{% endset %}{{ add_setting('AppImport', SWAI) }}
{% set SWBS %}<ReaderProvider>{% endset %}{{ add_setting('SiteWideWrapStart', SWBS) }}
{% set SWBS %}</ReaderProvider>{% endset %}{{ add_setting('SiteWideWrapEnd', SWBS) }}
{% set bpr %}
  import { Reader, useReader, Themes } from '@epubjs-react-native/core'
  import { useFileSystem } from '@epubjs-react-native/expo-file-system'
{% endset %}{{ save_delayed('bpr',bpr)}}
{% set ph %}const readerAccess = useReader(){% endset %}{{ save_delayed('ph',ph)}}
{% set bpr %}
import { Dimensions } from 'react-native'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Reader
  src={encodeURI({{ element.values.document | textOrVariableInCode }})}
  fileSystem={useFileSystem}
  manager="continuous"
  flow="scrolled"
  height={Dimensions.get('screen').height - 205}
  defaultTheme={Themes.SEPIA}
/>