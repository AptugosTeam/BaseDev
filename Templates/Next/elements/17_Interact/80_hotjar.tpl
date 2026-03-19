/*
path: hotjar.tpl
type: file
unique_id: l7MBVE26
icon: ico-hotjar
order: 80
name: HotJar Tracking
options:
  - name: trackingid
    display: Tracking ID
    type: text
    options: ''
  - name: version
    display: Version Hotjar
    type: text
    options: ''
sourceType: javascript
children: []
*/
{% set IBA %}
<!-- Hotjar Tracking Code -->
<script>
    (function(h,o,t,j,a,r){
        h.hj=h.hj||function(){(h.hj.q=h.hj.q||[]).push(arguments)};
        h._hjSettings={hjid:{{element.values.trackingid}},hjsv:{{element.values.version}}};
        a=o.getElementsByTagName('head')[0];
        r=o.createElement('script');r.async=1;
        r.src=t+h._hjSettings.hjid+j+h._hjSettings.hjsv;
        a.appendChild(r);
    })(window,document,'https://static.hotjar.com/c/hotjar-','.js?sv=');
</script>
{% endset %}
{{ add_setting('IndexBodyAdd', IBA) }}
// Hotar Analytics
