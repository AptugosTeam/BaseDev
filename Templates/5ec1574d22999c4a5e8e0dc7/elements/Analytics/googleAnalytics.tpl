/*
path: googleAnalytics.tpl
type: file
unique_id: l7PZVEme
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
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id={{ element.values.trackingid }}"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', '{{ element.values.trackingid }}');
</script>
{% endset %}
{{ add_setting('IndexBodyAdd', IBA) }}
// Google Analytics Track
