/*
path: clarity.tpl
type: file
unique_id: j7MBVx01
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

<!-- Clarity Tracking Code for https://www.be-fenix.com/eres-terapeuta -->
<script type="text/javascript">
    (function(c,l,a,r,i,t,y){
        c[a]=c[a]||function(){(c[a].q=c[a].q||[]).push(arguments)};
        t=l.createElement(r);t.async=1;t.src="https://www.clarity.ms/tag/"+i;
        y=l.getElementsByTagName(r)[0];y.parentNode.insertBefore(t,y);
    })(window, document, "clarity", "script", "{{element.values.trackingid}}");
</script>
{% endset %}
{{ add_setting('IndexBodyAdd', IBA) }}
// clarity Analytics
