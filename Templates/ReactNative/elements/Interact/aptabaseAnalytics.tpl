/*
path: aptabaseAnalytics.tpl
type: file
unique_id: hSVmFQccc
icon: ico-disqus
helpText: Add Aptabase Analytics to your Application
settings:
  - name: Packages
    value: '"@aptabase/react-native": "^0.3.9",'
options:
  - name: AptabaseKey
    display: Aptabase Key
    type: text
    options: ''
    settings:
      propertyCondition: trackEvent
      condition: false
  - name: trackEvent
    display: Track Event
    type: checkbox
    options: ''
    settings:
      default: false
  - name: eventName
    display: Event Name
    type: text
    settings:
      propertyCondition: trackEvent
      condition: true
  - name: eventValue
    display: Event Value
    type: text
    settings:
      propertyCondition: trackEvent
      condition: true
children: []
*/
{% if element.values.trackEvent %}
  {% set bpr %}
  import { trackEvent } from "@aptabase/react-native"
  {% endset %}
  {{ save_delayed('bpr',bpr) }}
  trackEvent("{{ element.values.eventName }}", {{ element.values.eventValue }})
{% else %}
  {% set appImport %}import Aptabase, { trackEvent } from "@aptabase/react-native"{% endset %}
  {{ add_setting('AppImport', appImport)}}
  {% set appBpr %}Aptabase.init("{{ element.values.AptabaseKey }}"){% endset %}
  {{ add_setting('AppBPR', appBpr)}}
  {% set appPageChange %}trackEvent("pageHit", { currentRouteName }){% endset %}
  {{ add_setting('AppPageChange', appPageChange)}}
{% endif %}