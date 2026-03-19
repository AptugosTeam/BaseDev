/*
path: RevolutCheckout.tpl
completePath: elements/Experimental/RevolutCheckout.tpl
unique_id: RymX77FF
icon: f:revolut.svg
helpText: 'Use Revolut Checkout API for payments 2024 version'
sourceType: javascript
children: []
options:
  - name: privateKey
    display: Revolut Private Key
    type: text
    options: ''
  - name: backendEndpoint
    display: Backend Endpoint
    type: text
    settings:
      default: '/create_order_revolut'
      active: true
  - name: successURL
    display: URL when the transaction is successful
    type: text
  - name: failureURL
    display: URL when the transaction is unsuccessful
    type: text
  - name: webhookURL
    display: Webhook URL
    type: text
    settings:
      default: '/webhook-revolut'
      active: true
settings:
  - name: ServerRoute
    value: |
      const axios = require('axios');
      const express = require('express');
      const bodyParser = require('body-parser');
      app.use(bodyParser.json());

      const REVOLUT_API = 'https://sandbox-merchant.revolut.com/api/1.0';
      const PRIVATE_KEY = {{ element.values.privateKey | textOrVariable }};

      // Create Order Route
      app.post('{{ element.values.backendEndpoint | default("/create_order_revolut") }}', async (req, res) => {
        const { amount, currency, description } = req.body;

        const orderData = {
          amount,
          currency,
          description,
          capture_mode: 'AUTOMATIC',
          merchant_order_ext_ref: `order_${Date.now()}`,
          success_redirect_url: '{{ element.values.successURL }}',
          failure_redirect_url: '{{ element.values.failureURL }}',
        };

        try {
          const response = await axios.post(
            `${REVOLUT_API}/order`,
            orderData,
            {
              headers: {
                Authorization: `Bearer ${PRIVATE_KEY}`,
                'Content-Type': 'application/json',
              },
            }
          );
          res.json({ checkout_url: response.data.checkout_url });
        } catch (error) {
          res.status(500).json({ error: error.response?.data || error.message });
        }
      });

      // Webhook Route
      app.post('{{ element.values.webhookURL | default("/webhook-revolut") }}', (req, res) => {
        const event = req.body;
        console.log('Revolut Webhook Event:', event);
        res.status(200).send('Webhook received');
      });
*/
