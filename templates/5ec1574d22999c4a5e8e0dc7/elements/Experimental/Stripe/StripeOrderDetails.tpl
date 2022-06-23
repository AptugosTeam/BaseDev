/*
path: StripeOrderDetails.tpl
type: file
unique_id: stripeod
icon: ico-field
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
axios.get(`{{ settings.apiURL }}/stripe-order-details/${ {{ element.values.sessionID }} }`).then(res => {
  {{ content | raw }}
})
