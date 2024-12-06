/*
path: mercadoPago.tpl
completePath: elements/Experimental/mercadoPago.tpl
unique_id: cvFUP89I
icon: ico-mercadopago
helpText: 'Use Mercado Pago Checkout API for payments'
sourceType: javascript
children: []
options:
  - name: accessToken
    display: Access Token
    type: text
    options: ''
  - name: publicaccesstoken
    display: Public Access Token
    type: text
    options: ''
  - name: backendEndpoint
    display: Endpoint for the backend
    type: text
    settings:
      default: '/api/mercadopago'
      active: true
  - name: successURL
    display: URL when the transaction is succesful
    type: text
  - name: failureURL
    display: URL when the transaction is unsuccesful
    type: text
  - name: pendingURL
    display: URL when the transaction was left pending
    type: text
  - name: functionName
    display: Function Name
    type: text
    settings:
      default: 'makePayment'
      active: true
settings:
  - name: BackendPackages
    value: '"mercadopago": "^1.5.9",'
  - name: Packages
    value: '"mercadopago": "^1.5.9","react-sdk-mercadopago": "^1.1.1",'
  - name: ServerRoute
    value: |
      const mercadopago = require ('mercadopago')
      app.post('{{ element.values.backendEndpoint | default('/api/mercadopago') }}', (req, res, next) => {
        const { items, access_token, marketplace_fee, ...bodyWithoutItems } = req.body
        mercadopago.configure({
          access_token: access_token || {{ element.values.accessToken | textOrVariable }}
        })
        let preference = { ...bodyWithoutItems }
        preference.items = [ ...req.body.items ]
        preference.auto_return = 'approved'
        if (marketplace_fee) preference.marketplace_fee = marketplace_fee
        preference.back_urls = {
          'success': '{{ element.values.successURL }}',
          'failure': '{{ element.values.failureURL }}',
          'pending': '{{ element.values.pendingURL }}'
        }
        mercadopago.preferences.create(preference)
          .then(function(response){
            res.json(response)
          }).catch(function(error){
            res.json(error)
          })
        })
*/
{% set bpr %}
import axios from 'axios'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set bpr %}
import { useMercadopago } from 'react-sdk-mercadopago'
{% endset %}
{{ save_delayed('bpr',bpr) }}
const mercadopago = useMercadopago.v2({{ element.values.publicaccesstoken }}, {
  locale: 'es-AR'
})
const {{ element.values.functionName | default('makePayment') }} = (cart) => {
  if (mercadopago) {
    axios({
      url: '{{ settings.apiURL }}{{ element.values.backendEndpoint }}',
      method: 'POST',
      data: cart,
    }).then(response => {
      window.location.href = response.data.body.sandbox_init_point
    })
  }
}