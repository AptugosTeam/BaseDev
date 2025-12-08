/*
path: I18N.tpl
keyPath: elements/15_Programming/Snippets/I18N.tpl
unique_id: SoIcXKlJ
settings:
  - name: Packages
    value: '"i18next": "^25.6.3","react-i18next": "^16.3.5",'
extraFiles:
  - source: 'elements/99_ExtraFiles/i18n.tsx'
    destination: 'front-end/i18n.tsx'
*/
{% set SWBS %}<I18nextProvider i18n={i18n}>{% endset %}{{ add_setting('SiteWideWrapStart', SWBS) }}
{% set SWBS %}</I18nextProvider>{% endset %}{{ add_setting('SiteWideWrapEnd', SWBS) }}
{% set appImports %}
  import { I18nextProvider } from 'react-i18next'
  import i18n from './i18n'
{% endset %}{{ add_setting('AppImports', appImports) }}
{% set bpr %}import { useTranslation } from 'react-i18next'{% endset %}{{ save_delayed('bpr',bpr)}}
{% set bpr %}
import AsyncStorage from '@react-native-async-storage/async-storage'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set ph %}
  const [language, setLanguage] = React.useState('en')
  useFocusEffect(
    React.useCallback(() => {
      AsyncStorage.getItem('appLanguage').then((lng) => {
        if (lng) {
          setLanguage(lng)
          i18n.changeLanguage(lng)
        }
      })
    }, [])
  )
  const { i18n } = useTranslation()
{% endset %}
{{ save_delayed('ph',ph) }}