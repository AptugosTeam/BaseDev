/*
path: stripeCheckoutData.tpl
completePath: elements/Experimental/Stripe/stripeCheckoutData.tpl
type: file
unique_id: p0mBqZ1M
icon: ico-function
sourceType: javascript
helpText: aun no tengo
options:
  - name: clientReferenceID
    display: ID for the client making the transaction
    type: text
    options: ''
  - name: devPriceItem
    display: Stripe's Price Item code for DEVELOPMENT
    type: text
    options: ''
  - name: priceItem
    display: Stripe's Price Item code for PRODUCTION
    type: text
    options: ''
  - name: successURL
    display: Use a specific success URL
    type: text
    advanced: true
  - name: cancelURL
    display: Use a specific cancel URL
    type: text
    advanced: true
  - name: functionBody
    display: Body
    type: function
    options: ''
    advanced: true
children: []
*/

{% set ph %}
const sendStripeForm = (price = null, extraData = null) => {
  const url = `{{ settings.apiURL  ~'/create-checkout-session/' ~ element.values.clientReferenceID | default(1) ~ '/' }}{{ type == 'Development' ? element.values.devPriceItem : element.values.priceItem }}` || ''


  const form = document.createElement('form')
  form.method = 'POST'
  form.action = url


  const criField = document.createElement('input')
  criField.name = 'client_reference_id'
  criField.value = {{ element.values.clientReferenceID | default(1) }} || 1
  form.appendChild(criField)

  if(price) {
    const amount = document.createElement('input')
    amount.name = 'amount'
    amount.value = price
    form.appendChild(amount)
  }
  if(extraData) {
    const data = document.createElement('input')
    data.name = 'data'
    data.value = JSON.stringify(extraData)
    form.appendChild(data)
  }
{% if element.values.successURL %}
  let suField = document.createElement('input')
  suField.name = 'successURL'
  suField.value = {{ element.values.successURL | textOrVariable }}
  form.appendChild(suField)
{% endif %}
{% if element.values.cancelURL %}
  let cancelField = document.createElement('input')
  cancelField.name = 'cancelURL'
  cancelField.value = {{ element.values.cancelURL }}
  form.appendChild(cancelField)
{% endif %}

  {{ element.values.functionBody | raw }}
  {{ content | raw }} 

  document.body.appendChild(form)
  form.submit()
}
{% endset %}
{{ save_delayed('ph',ph,1) }}


