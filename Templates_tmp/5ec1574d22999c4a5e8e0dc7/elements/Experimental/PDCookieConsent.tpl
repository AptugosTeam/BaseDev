/*
path: PDCookieConsent.tpl
type: file
unique_id: av3v7cxo
icon: ico-cookie-consent
options:
  - name: organizationName
    display: Organization Name
    type: text
    options: ''
  - name: organizationUrl
    display: Organization URL
    type: text
    options: ''
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
    "name": {{ element.values.organizationName | textOrVariable }},
    "url" : {{ element.values.organizationUrl | textOrVariable }},
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