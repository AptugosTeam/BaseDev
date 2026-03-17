/*
path: _app.tsx
keyPath: src/pages/_app.tsx
unique_id: VgbVvbLq
*/
import type { AppProps } from 'next/app'
import { AppCacheProvider } from '@mui/material-nextjs/v13-pagesRouter'
{{ insert_setting('SiteWideBeforePageRenderAddenum') | raw }}
import '@components/Themes/layout.scss';

export default function App({ Component, pageProps }: AppProps) {
  return <AppCacheProvider {...pageProps}>
    {{ insert_setting('SiteWideAddenum') | raw }}
    <Component {...pageProps} />
  </AppCacheProvider>
}
