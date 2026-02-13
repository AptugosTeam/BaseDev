/*
path: Stripe.tpl
completePath: elements/Experimental/Stripe/Stripe.tpl
type: file
unique_id: stripe
icon: f:Stripe.svg
helpText: Use Stripe Payments
children: []
options:
  - name: devApiKey
    display: Secret Stripe's DEVELOPMENT API key.
    type: text
    options: ''
  - name: devPriceItem
    display: Stripe's Price Item code for DEVELOPMENT
    type: text
    options: ''
  - name: devIdPrice
    display: Stripe's Product Id for DEVELOPMENT
    type: text
    settings:
      propertyCondition: amount
      condition: true
  - name: apikey
    display: Secret Stripe's API key.
    type: text
    options: ''
  - name: priceItem
    display: Stripe's Price Item code
    type: text
    options: ''
  - name: successURL
    display: Redirect to this URL when done
    type: text
    options: ''
  - name: cancelURL
    display: Redirect to this URL when not done
    type: text
    options: ''
  - name: skipFrontEnd
    display: Do not render anything in the front-end
    type: checkbox
  - name: amount
    display: Is an Amount
    type: checkbox
    options: ''
    settings:
      default: false
  - name: idPrice
    display: Id product
    type: text
    settings:
      propertyCondition: amount
      condition: true

settings:
  - name: BackendPackages
    value: '"stripe": "^8.201.0",'
  - name: ServerRoute
    value: |
      const stripe = require('stripe')(`{{ type == 'Development' ? element.values.devApiKey : element.values.apikey }}`);
      app.post('/create-checkout-session/:qty?/:productid?/:mode?/:currency?', async (req, res) => {
        const successURL = req.body.successURL || `{{ element.values.successURL }}`
        const cancelURL = req.body.cancelURL || `{{ element.values.cancelURL }}`
        {% if element.values.amount %}
          const {amount} = req.body;
          const {currency = 'usd' } = req.params
          let amountToCharge
          if(currency === 'usd') {
            amountToCharge  = parseInt(amount * 100)
          } else {
            amountToCharge = amount
          }
          stripe.checkout.sessions.create({
            line_items: [
              {
                price_data: {
                  unit_amount: amountToCharge,
                  currency,
                  product: `{{ type == 'Development' ? element.values.devIdPrice : element.values.idPrice }}`
                } ,
                quantity: req.params.qty || 1,
              },
          ],
        {% else %}
        stripe.checkout.sessions.create({
          line_items: [
            {
              price: req.params.productid || `{{ type == 'Development' ? element.values.devPriceItem : element.values.priceItem }}`,
              quantity: req.params.qty || 1,
            },
          ],
        {% endif %}
          mode: req.params.mode || 'payment',
          client_reference_id: req.body.client_reference_id || null,
          success_url: successURL,
          cancel_url: cancelURL,
        }).then(session => {
          res.redirect(303, session.url);
        }).catch(err => {
          res.send(err)
        })
      })
*/
{% if not element.values.skipFrontEnd %}
{% set bpr %}
const ProductDisplay = () => (
  <section>
    <div className="product">
      <img
        src="https://i.imgur.com/EHyR2nP.png"
        alt="The cover of Stubborn Attachments"
      />
      <div className="description">
      <h3>Stubborn Attachments</h3>
      <h5>$20.00</h5>
      </div>
    </div>
    <form action="http://localhost:4567/create-checkout-session" method="POST">
      <button type="submit">
        Checkout
      </button>
    </form>
  </section>
);

const Message = ({ message }) => (
  <section>
    <p>{message}</p>
  </section>
);
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set ph %}
const [message, setMessage] = React.useState("");
React.useEffect(() => {
    // Check to see if this is a redirect back from Checkout
    const query = new URLSearchParams(window.location.search);

    if (query.get("success")) {
      setMessage("Order placed! You will receive an email confirmation.");
    }

    if (query.get("canceled")) {
      setMessage(
        "Order canceled -- continue to shop around and checkout when you're ready."
      );
    }
  }, []);
{% endset %}
{{ save_delayed('ph',ph) }}
{message ? <Message message={message} /> : <ProductDisplay /> }
{% endif %}