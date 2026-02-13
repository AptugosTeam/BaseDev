/*
path: mercadoPagoOauth.tpl
completePath: elements/Experimental/mercadoPagoOauth.tpl
unique_id: mercadoPagoOauth
icon: ico-mercadopago
helpText: 'Oauth mechanism for Mercado Pago Payment Gateway'
sourceType: javascript
children: []
options:
  - name: clientID
    display: Client ID
    type: text
    options: ''
  - name: clientSecret
    display: Client Secret
    type: text
    options: ''
  - name: Code
    display: Code
    type: text
  - name: RedirectURI
    display: Redirect URI
    type: text
  - name: backendEndpoint
    display: Endpoint for the backend
    type: text
    settings:
      default: '/api/mercadopagooauth'
      active: true
settings:
  - name: ServerRoute
    value: |
      const axios = require('axios')
      app.post('{{ element.values.backendEndpoint | default('/api/mercadopagooauth') }}', (req, res, next) => {
        axios.post('https://api.mercadopago.com/oauth/token', {
          client_id: {{ element.values.clientID }},
          client_secret: {{ element.values.clientSecret }},
          grant_type: 'authorization_code',
          code: {{ element.values.Code }},
          redirect_uri: {{ element.values.RedirectURI }}
        }).then(mpres => {
          res.send(mpres.data)
        }).catch(e => {
          res.send(e)
        })
      })
*/
// Mercado Pago Oauth Implementation (endpoint: {{ element.values.backendEndpoint | default('/api/mercadopagooauth') }})