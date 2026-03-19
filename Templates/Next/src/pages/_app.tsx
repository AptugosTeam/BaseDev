/*
path: _app.tsx
keyPath: src/pages/_app.tsx
unique_id: VgbVvbLq
*/
{% if application.tables.length > 0 %}{% set hasTables = true %}{% else %}{% set hasTables = false %}{% endif %}
import type { AppProps } from 'next/app'
import { AppCacheProvider } from '@mui/material-nextjs/v13-pagesRouter'
{{ insert_setting('SiteWideBeforePageRenderAddenum') | raw }}
{% if hasTables %}
import { Provider } from 'react-redux'
import store from '../store/store'
{% endif %}
import '@components/Themes/layout.scss';

export default function App({ Component, pageProps }: AppProps) {
  return {% if hasTables %}<Provider store={store}>{% endif %}
  <AppCacheProvider {...pageProps}>
    {{ insert_setting('SiteWideAddenum') | raw }}
    <Component {...pageProps} />
  </AppCacheProvider>
  {% if hasTables %}</Provider>{% endif %}
}
