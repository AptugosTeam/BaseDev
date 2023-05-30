/*
path: fallback.tpl
type: file
unique_id: l7Pfbfbme
icon: ico-google-analytics
sourceType: javascript
children: []
*/
{% set IBA %}
{{ content | raw }}
{% enset %}
{{ add_setting('FallBack', IBA) }}

