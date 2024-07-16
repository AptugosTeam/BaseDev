/*
path: PDCookieConsent.tpl
type: file
unique_id: av3v7cxo
icon: ico-cookie-consent
options:
  - name: cookiePolicyLink
    display: Cookie Policy Link
    type: text
    options: ''
  - name: hideModalIn
    display: Array of pages where to hide cookies
    type: text
    options: ''
sourceType: javascript
children: []
*/
{% set IBA %}

<!-- PDCookieConsent -->
<link rel="stylesheet" href="https://pdcc.gdpr.es/pdcc.min.css">
<script charset="utf-8" src="https://pdcc.gdpr.es/pdcc.min.js"></script>
    <script type="text/javascript">
    PDCookieConsent.config({
    "defaultLang" : "es",
    "brand": {
    "dev" : true,
    "name": "SOLUCIÓN DE OBLIGACIONES NORMATIVAS",
    "url" : "https://sonorsolucionesnormativas.es",
    "websiteOwner" : ""
    },
    "showRejectButton": true,
    "cookiePolicyLink": {{ element.values.cookiePolicyLink | textOrVariable }},
    "hideModalIn": [{{ element.values.hideModalIn | textOrVariable }}],
    "styles": {
    "primaryButton": {
    "bgColor" : "#EEEEEE",
    "txtColor": "#333333"
    },
    "secondaryButton": {
    "bgColor" : "#EEEEEE",
    "txtColor": "#333333"
    },
    "rejectButton": {
    "bgColor": "#EEEEEE",
    "txtColor": "#333333"
    }
    }
    });
    </script>
<!-- PDCookieConsent -->
{% endset %}
{{ add_setting('IndexBodyAdd', IBA) }}