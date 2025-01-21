/*
path: firebaseAnalytics.tpl
completePath: elements/Interact/firebaseAnalytics.tpl
type: file
unique_id: MdBfgy9K
icon: f:Stripe.svg
display: Firebase Analytics
helpText: Add Firebase Analytics to your Application
children: []
options:
  - name: enableAndroid
    display: Android?
    type: checkbox
    settings:
      default: false
  - name: startAnalyticsAndroid
    display: Android
    type: separator
    settings:
      propertyCondition: enableAndroid
      condition: true
  - name: apiKeyAndroid
    display: API Key
    type: text
    settings:
      propertyCondition: enableAndroid
      condition: true
  - name: authDomainAndroid
    display: Authentication Domain
    type: text
    settings:
      propertyCondition: enableAndroid
      condition: true
  - name: projectIdAndroid
    display: Project ID
    type: text
    settings:
      propertyCondition: enableAndroid
      condition: true
  - name: storageBucketAndroid
    display: Storage Bucket
    type: text
    settings:
      propertyCondition: enableAndroid
      condition: true
  - name: messagingSenderIdAndroid
    display: Messaging Sender ID
    type: text
    settings:
      propertyCondition: enableAndroid
      condition: true
  - name: appIdAndroid
    display: App ID
    type: text
    settings:
      propertyCondition: enableAndroid
      condition: true
  - name: measurementIdAndroid
    display: Measurement ID
    type: text
    settings:
      propertyCondition: enableAndroid
      condition: true
  - name: endAnalyticsAndroid
    display: End Android
    type: separator
    settings:
      propertyCondition: enableAndroid
      condition: true
  - name: enableIos
    display: iOS?
    type: checkbox
    settings:
      default: false
  - name: startAnalyticsIos
    display: iOS
    type: separator
    settings:
      propertyCondition: enableIos
      condition: true
  - name: apiKeyIos
    display: API Key
    type: text
    settings:
      propertyCondition: enableIos
      condition: true
  - name: authDomainIos
    display: Authentication Domain
    type: text
    settings:
      propertyCondition: enableIos
      condition: true
  - name: projectIdIos
    display: Project ID
    type: text
    settings:
      propertyCondition: enableIos
      condition: true
  - name: storageBucketIos
    display: Storage Bucket
    type: text
    settings:
      propertyCondition: enableIos
      condition: true
  - name: messagingSenderIdIos
    display: Messaging Sender ID
    type: text
    settings:
      propertyCondition: enableIos
      condition: true
  - name: appIdIos
    display: App ID
    type: text
    settings:
      propertyCondition: enableIos
      condition: true
  - name: measurementIdIos
    display: Measurement ID
    type: text
    settings:
      propertyCondition: enableIos
      condition: true
  - name: endAnalyticsIos
    display: End iOS
    type: separator
    settings:
      propertyCondition: enableIos
      condition: true
settings:
  - name: Packages
    value: '"firebase": "^11.2.0","@react-native-firebase/analytics": "^21.7.1","@react-native-firebase/app": "^21.7.1",'
extraFiles:
  - source: 'elements/Interact/990_firebase.js'
    destination: 'front-end/services/firebase.js'
*/

{% set AppJsonAndroid %}"googleServicesFile": "./google-services.json",{% endset %}
{{ add_setting('AppJsonAndroid', AppJsonAndroid)}}
{% set AppJsonIos %}"googleServicesFile": "./GoogleService-Info.plist",{% endset %}
{{ add_setting('AppJsonIos', AppJsonIos)}}