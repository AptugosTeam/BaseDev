/*
path: posthog.tpl
type: file
unique_id: c94nfl6n
icon: ico-google-analytics
options:
  - name: trackingid
    display: Tracking ID
    type: text
    options: ''
sourceType: javascript
children: []
*/
{% set IPA %}
import posthog from 'posthog-js'
if (!window.location.host.includes('127.0.0.1') && !window.location.host.includes('localhost')) {
  posthog.init('{{element.values.trackingid}}', { api_host: "https://us.i.posthog.com" }) 
}
{% endset %}
{{ add_setting('IndexPreAdd', IPA) }}