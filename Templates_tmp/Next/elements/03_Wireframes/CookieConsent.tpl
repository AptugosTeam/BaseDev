/*
path: CookieConsent.tpl
type: file
unique_id: lASO3FMC
icon: ico-cookie-consent
options:
  - name: cookieName
    display: Cookie Name
    type: text
    options: ''
  - name: component
    display: Component
    type: dropdown
    options: Snackbar;Dialog
  - name: message
    display: Message
    type: text
    options: ''
settings:
  - name: DevPackages
    value: '"material-ui-cookie-consent": "^0.1.0",'
children: []
*/
{% set bpr %}
import MUICookieConsent from 'material-ui-cookie-consent'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<MUICookieConsent 
  cookieName="{{ element.values.cookieName }}"
  componentType="{{ element.values.component }}"
  message="{{ element.values.message }}"
/>