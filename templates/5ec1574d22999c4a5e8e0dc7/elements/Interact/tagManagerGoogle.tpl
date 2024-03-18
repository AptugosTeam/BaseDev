/*
path: tagManagerGoogle.tpl
type: file
unique_id: l7VMEB26
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

<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','{{element.values.trackingid}}');</script>
<!-- End Google Tag Manager -->
{% endset %}
{{ add_setting('IndexBodyAdd', IBA) }}

{% set IPA %}
<!-- Google Tag Manager (noscript) -->
<noscript>
  <iframe
    src="https://www.googletagmanager.com/ns.html?id={{element.values.trackingid}}"
    height="0" width="0" style="display:none; visibility:hidden">
  </iframe>
</noscript> 
<!-- End Google Tag Manager (noscript) -->
{% endset %}
{{ add_setting('IndexPageAdd', IPA) }}