/*
path: firebaseAnalytics.tpl
completePath: elements/Interact/firebaseAnalytics.tpl
type: file
unique_id: MdBfgy9K
icon: f:Stripe.svg
display: Firebase Analytics
helpText: Add Firebase Analytics to your Application
children: []
settings:
  - name: Packages
    value: '"@react-native-firebase/analytics": "^21.7.1","@react-native-firebase/app": "^21.7.1",'
*/

{% set AppJsonAndroid %}"googleServicesFile": "./google-services.json",{% endset %}
{{ add_setting('AppJsonAndroid', AppJsonAndroid)}}
{% set AppJsonIos %}"googleServicesFile": "./GoogleService-Info.plist",{% endset %}
{{ add_setting('AppJsonIos', AppJsonIos)}}