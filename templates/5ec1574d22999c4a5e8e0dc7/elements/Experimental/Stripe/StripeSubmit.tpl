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
  - name: successURL
    display: Use a specific success URL
    type: text
  - name: amount
    display: Is an Amount
    type: checkbox
    options: ''
    settings:
      default: false
  - name: price
    display: Product price
    type: text
    settings:
      propertyCondition: amount
      condition: true
*/
let form = document.createElement('form')
{% if element.values.clientReferenceID %}
  let criField = document.createElement('input')
  criField.name = 'client_reference_id'
  criField.value = {{ element.values.clientReferenceID }}
  form.appendChild(criField)
{% endif %}
{% if element.values.amount %}
  let amount = document.createElement('input')
  amount.name = 'amount'
  amount.value = {{ element.values.price }}
  form.appendChild(amount)
{% endif %}
{% if element.values.successURL %}
  let suField = document.createElement('input')
  suField.name = 'successURL'
  suField.value = {{ element.values.successURL | textOrVariable }}
  form.appendChild(suField)
{% endif %}
form.method = 'POST'

form.action = {{ element.values.submitURL }}
document.body.appendChild(form)
form.submit()