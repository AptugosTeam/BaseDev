/*
path: 990_firebase.js
completePath: >-
  C:\Users\Usuario\Aptugo\BaseDev\Templates\ReactNative\elements\Interact\990_firebase.js
keyPath: elements\Interact\990_firebase.js
unique_id: mdlye04H
*/
import { initializeApp } from 'firebase/app'
import { getAnalytics, logEvent } from 'firebase/analytics'
import { Platform } from 'react-native'

{% if element.values.enableAndroid %}
const firebaseConfigAndroid = {
  apiKey: '{{element.values.apiKeyAndroid}}',
  authDomain: '{{element.values.authDomainAndroid}}',
  projectId: '{{element.values.projectIdAndroid}}',
  storageBucket: '{{element.values.storageBucketAndroid}}',
  messagingSenderId: '{{element.values.messagingSenderIdAndroid}}',
  appId: '{{element.values.appIdAndroid}}',
  measurementId: '{{element.values.measurementIdAndroid}}',
}
{% endif %}

{% if element.values.enableIos %}
const firebaseConfigIOS = {
  apiKey: '{{element.values.apiKeyIos}}',
  authDomain: '{{element.values.authDomainIos}}',
  projectId: '{{element.values.projectIdIos}}',
  storageBucket: '{{element.values.storageBucketIos}}',
  messagingSenderId: '{{element.values.messagingSenderIdIos}}',
  appId: '{{element.values.appIdIos}}',
  measurementId: '{{element.values.measurementIdIos}}',
}
{% endif %}

{% if element.values.enableAndroid and element.values.enableIos %}
const firebaseConfig = Platform.OS === 'android' ? firebaseConfigAndroid : firebaseConfigIOS
{% elseif element.values.enableAndroid %}
const firebaseConfig = firebaseConfigAndroid
{% elseif element.values.enableIos %}
const firebaseConfig = firebaseConfigIOS
{% endif %}
const app = initializeApp(firebaseConfig)
const analytics = getAnalytics(app)

export { app, analytics, logEvent }