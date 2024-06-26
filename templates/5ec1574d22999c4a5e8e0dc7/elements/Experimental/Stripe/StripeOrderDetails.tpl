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
  - name: backendRoute
    display: Only Server Route
    type: checkbox
    settings:
      default: false
  - name: backendCode
    display: Code to run on backend
    type: code
settings:
  - name: BackendPackages
    value: '"stripe": "^8.201.0",'
  - name: ServerRoute
    value: |
      app.get('/stripe-order-details/:session_id', async (req, res) => {
        const session = await stripe.checkout.sessions.retrieve(req.params.session_id)
        {% if element.values.backendCode %}
          {{ element.values.backendCode }}
        {% else %}
          res.send(session)
        {% endif %}
      })
*/
{% if not element.values.backendRoute %}
  axios.get(`{{ settings.apiURL }}/stripe-order-details/${ {{ element.values.sessionID }} }`).then(res => {
    {{ content | raw }}
  })
{% endif %}
