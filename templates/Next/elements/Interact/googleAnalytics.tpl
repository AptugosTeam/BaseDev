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
import { GoogleAnalytics } from '@next/third-parties/google'
{% endset %}
{{ add_setting('SiteWideBeforePageRenderAddenum', IBA) }}
{% set IBB %}
<GoogleAnalytics gaId="{{ element.values.trackingid }}" />
{% endset %}
{{ add_setting('SiteWideAddenum'), IBB }}
