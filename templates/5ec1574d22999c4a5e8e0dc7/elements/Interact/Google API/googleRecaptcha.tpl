/*
path: googleRecaptcha.tpl
type: file
unique_id: urRobl4d
icon: ico-field
order: 1
helpText: Allows you to use Google reCaptcha
sourceType: javascript
options:
  - name: sitekey
    display: Site API Key
    type: text
    options: ''
    required: true
  - name: secretKey
    display: Secret API Key
    type: text
    options: ''
    required: true
  - name: onChange
    display: On Change
    type: function
    options: ''
  - name: hl
    display: Language
    type: dropdown
    options: return [['en','English (US)'],['es','Spanish'],['pt','Portuguese']]
    settings:
      default: 'en'
  - name: ref
    display: Ref (optional)
    type: text
    options: ''
settings:
  - name: Packages
    value: '"react-google-recaptcha": "^3.1.0",'
  - name: ServerRoute
    value: |
      const axios = require('axios')
      app.post('/verifyCaptcha', async (req, res) => {
        console.log("inicio backend")
        const {captcha} = req.body;
        const secretKey ='{{ element.values.secretKey }}';
        const url = 'https://www.google.com/recaptcha/api/siteverify';
        console.log("captcha", captcha)
        const response = await axios.post(url, new URLSearchParams({secret: secretKey, response: captcha}))
        console.log("response", response.data)
        res.send(response.data)
      })
children: []
*/
{% set bpr %}
import ReCAPTCHA from 'react-google-recaptcha'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<ReCAPTCHA 
  sitekey='{{ element.values.sitekey }}'
  {% if element.values.onChange %}
    onChange={ (recaptcha)=> { {{element.values.onChange}} } }
  {% endif %}
  {% if element.values.hl %}
    hl='{{ element.values.hl|default("en") }}'
  {% endif %}
/>