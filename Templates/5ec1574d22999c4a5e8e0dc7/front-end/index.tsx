/*
path: index.tsx
completePath: front-end/index.tsx
unique_id: RfBLgczw
children: []
*/
{% if application.tables.length > 0 %}{% set hasTables = true %}{% else %}{% set hasTables = false %}{% endif %}
import React from 'react'
import { hydrate, render } from 'react-dom'
import { createBrowserHistory } from 'history'
import { Router } from 'react-router-dom'
import ScrollToTop from './components/ScrollToTop'
{% if hasTables %}
import { Provider } from 'react-redux'
import store from './store/store'
{% endif %}
import * as serviceWorker from './serviceWorker'

import App from './App'

const hist = createBrowserHistory()
{{ insert_setting('IndexPreAdd') }}

const rootElement = document.getElementById('app')
const app = {% if hasTables %}<Provider store={store}>{% endif %}
<Router history={hist}>
  <ScrollToTop />
  <App />
</Router>
{% if hasTables %}</Provider>{% endif %}

if (rootElement.hasChildNodes()) {
  hydrate(app, rootElement)
} else {
  render(app, rootElement)
}

serviceWorker.register()
