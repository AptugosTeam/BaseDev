/*
path: MercadoPagoCheckout.tpl
completePath: elements/Experimental/MercadoPagoCheckout.tpl
unique_id: FR22co21
icon: f:mercadoPago.svg
helpText: 'Use Mercado Pago Checkout Pro for payments 2024 version'
sourceType: javascript
children: []
options:
  - name: accessToken
    display: Access Token
    type: text
    options: ''
  - name: backendEndpoint
    display: Backend Endpoint
    type: text
    settings:
      default: '/create_preference'
      active: true
  - name: successURL
    display: URL when the transaction is successful
    type: text
  - name: failureURL
    display: URL when the transaction is unsuccessful
    type: text
  - name: pendingURL
    display: URL when the transaction is pending
    type: text
settings:
  - name: BackendPackages
    value: '"mercadopago": "^1.5.9",'
  - name: ServerRoute
    value: |
      const mercadopago = require('mercadopago');
      mercadopago.configurations.setAccessToken({{ element.values.accessToken | textOrVariable }});
      
      app.post('{{ element.values.backendEndpoint | default("/create_preference") }}', async (req, res) => {
        const { title, quantity, unit_price } = req.body;

        const preference = {
          items: [
            {
              title,
              quantity,
              unit_price
            }
          ],
          back_urls: {
            success: '{{ element.values.successURL }}',
            failure: '{{ element.values.failureURL }}',
            pending: '{{ element.values.pendingURL }}'
          },
          auto_return: 'approved'
        };

        try {
          const response = await mercadopago.preferences.create(preference);
          res.json({ id: response.body.id });
        } catch (error) {
          res.status(500).json({ error: error.message });
        }
      });
*/
