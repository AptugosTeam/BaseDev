/*
path: facebookTracking.tpl
type: file
unique_id: cMBZw7qs
icon: ico-google-analytics
options:
  - name: trackingid
    display: Tracking ID
    type: text
    options: ''
sourceType: javascript
children: []
*/
{% set IBA %}
<!-- Global site tag - facebook Track -->
 <meta name="facebook-domain-verification" content="{{ element.values.trackingid }}" />

{% endset %}
{{ add_setting('IndexBodyAdd', IBA) }}
// Facebook Track


