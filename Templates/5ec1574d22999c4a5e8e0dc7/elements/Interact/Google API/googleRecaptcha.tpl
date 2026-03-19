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
  - name: size
    display: Size
    type: dropdown
    options: return [['normal','Normal'],['compact','Compact']]
    settings:
      default: 'normal'
  - name: asyncScriptOnLoad
    display: On Load
    type: function
    options: ''
    advanced: true
  - name: style
    display: Extra Styles
    type: text
    options: ''
    advanced: true
settings:
  - name: Packages
    value: '"react-google-recaptcha": "^3.1.0",'
  - name: ServerRoute
    value: |
      const axios = require('axios')
      app.post('/verifyCaptcha', async (req, res) => {
        try {
          const { captcha } = req.body;

          if (!captcha) return res.status(400).send({ message: 'CAPTCHA is required' });

          const secretKey = '{{ element.values.secretKey }}';
          const url = 'https://www.google.com/recaptcha/api/siteverify';

          const { data } = await axios.post(url, new URLSearchParams({ secret: secretKey, response: captcha }));

          if (data.success) return res.status(200).send(true);
          else { 
            return res.status(400).send({ message: 'Error verifying CAPTCHA' })
          }
        } catch (error) {
          res.status(500).send({ message: 'Error verifying CAPTCHA' });
        }
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
  {% if element.values.asyncScriptOnLoad %}
    asyncScriptOnLoad={ ({ loaded })=> { 
      {{element.values.asyncScriptOnLoad}}
    } }
  {% endif %}
  {% if element.values.hl %}
    hl='{{ element.values.hl|default("en") }}'
  {% endif %}
  {% if element.values.style %}
    style={ {{ element.values.style }} }
  {% endif %}
  {% if element.values.size %}
    size='{{ element.values.size|default("normal") }}'
  {% endif %}
/>