/*
path: firebaseAnalytics.tpl
completePath: elements/Interact/firebaseAnalytics.tpl
type: file
unique_id: MdBfgy9K
icon: f:Stripe.svg
display: Firebase Analytics
helpText: Configure Firebase Analytics for the React Native app and wire the native Firebase project files
children: []
settings:
  - name: Packages
    value: '"@react-native-firebase/analytics": "^21.7.1","@react-native-firebase/app": "^21.7.1",'
*/

{% set AppJsonAndroid %}"googleServicesFile": "./google-services.json",{% endset %}
{{ add_setting('AppJsonAndroid', AppJsonAndroid)}}
{% set AppJsonIos %}"googleServicesFile": "./GoogleService-Info.plist",{% endset %}
{{ add_setting('AppJsonIos', AppJsonIos)}}
