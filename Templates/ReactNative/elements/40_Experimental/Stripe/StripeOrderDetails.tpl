/*
path: StripeOrderDetails.tpl
completePath: elements/Experimental/Stripe/StripeOrderDetails.tpl
type: file
unique_id: stripeod
icon: f:StripeOrderDetails.svg
helpText: Retrieve Order Details from SessionID
children: []
options:
  - name: sessionID
    display: Variable containing the SessionID
    type: text
    options: ''
settings:
  - name: BackendPackages
    value: '"stripe": "^8.201.0",'
  - name: ServerRoute
    value: |
      app.get('/stripe-order-details/:session_id', async (req, res) => {
        const session = await stripe.checkout.sessions.retrieve(req.params.session_id)
        res.send(session)
      })
*/
{% set bpr %}
import axios from 'axios'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set bpr %}
import { resolveApiUrl } from '@services/api'
{% endset %}
{{ save_delayed('bpr',bpr) }}
axios.get(resolveApiUrl(`/stripe-order-details/${ {{ element.values.sessionID }} }`)).then(res => {
  {{ content | raw }}
})
