/*
path: googleAnalytics.tpl
type: file
unique_id: l7PZVEme
icon: ico-google-analytics
helpText: Initialize Google Analytics for the mobile app using the configured Firebase or Expo setup
options:
  - name: trackingid
    display: Tracking ID
    helpText: Analytics or measurement identifier used by the configured provider
    type: text
    options: ''
settings:
  - name: Packages
    value: '"expo-firebase-analytics": "latest",'
children: []
*/
{% set AppJsonAndroid %}"googleServicesFile": "./google-services.json",{% endset %}
{{ add_setting('AppJsonAndroid', AppJsonAndroid)}}
{% set AppJsonIos %}"googleServicesFile": "./GoogleService-Info.plist",{% endset %}
{{ add_setting('AppJsonIos', AppJsonIos)}}
