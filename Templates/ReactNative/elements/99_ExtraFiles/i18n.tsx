/*
path: i18n.tsx
completePath: >-
  /Users/Shared/Dev/BaseDev/Templates/ReactNative/elements/99_ExtraFiles/i18n.tsx
keyPath: elements/99_ExtraFiles/i18n.tsx
unique_id: dBquPV68
*/
import i18n from 'i18next'
import { initReactI18next } from 'react-i18next'

i18n
  .use(initReactI18next)
  .init({
    lng: 'es',
    fallbackLng: 'en',
    resources: {
      {% for child in element.children %}
        {{ child.name }}: { translation: {{ child.rendered }}},
      {% endfor %}
    },
    interpolation: {
      escapeValue: false,
    },
  })

export default i18n