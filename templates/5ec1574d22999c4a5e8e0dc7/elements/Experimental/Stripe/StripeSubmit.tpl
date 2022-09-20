/*
path: StripeSubmit.tpl
completePath: elements/Experimental/Stripe/StripeSubmit.tpl
type: file
unique_id: stripesubmit
icon: f:StripeSubmit.svg
helpText: Redirect to stripe payment screen
children: []
options:
  - name: submitURL
    display: Submit URL for your stripe checkout
    type: text
    options: ''
  - name: clientReferenceID
    display: ID for the client making the transaction
    type: text
    options: ''
*/
let form = document.createElement('form')
{% if element.values.clientReferenceID %}
  let criField = document.createElement('input')
  criField.name = 'client_reference_id'
  criField.value = {{ element.values.clientReferenceID }}
  form.appendChild(criField)
{% endif %}
form.method = 'POST'

form.action = {{ element.values.submitURL }}
document.body.appendChild(form)
form.submit()