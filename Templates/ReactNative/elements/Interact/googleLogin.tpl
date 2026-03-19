/*
path: googleLogin.tpl
completePath: >-
  /Users/gastongorosterrazu/Aptugo/BaseDev/templates/ReactNative/elements/Interact/googleLogin.tpl
keyPath: elements/Interact/googleLogin.tpl
unique_id: zo8Ko17z
settings:
  - name: Packages
    value: '"expo-build-properties": "~0.8.3","@react-native-firebase/app": "^18.0.0", "@react-native-firebase/auth": "^18.0.0", "@react-native-google-signin/google-signin": "^10.0.1",'
*/
{% set AppJsonAndroid %}"googleServicesFile": "./google-services.json",{% endset %}
{{ add_setting('AppJsonAndroid', AppJsonAndroid)}}
{% set AppJsonIos %}"googleServicesFile": "./GoogleService-Info.plist",{% endset %}
{{ add_setting('AppJsonIos', AppJsonIos)}}
{% set AppJsonPlugins %}
"@react-native-firebase/app",
"@react-native-google-signin/google-signin",
[
  "expo-build-properties",
  {
    "ios": {
      "useFrameworks": "static"
    }
  }
],
{% endset %}
{{ add_setting('AppJsonPlugins', AppJsonPlugins)}}
{% set metroConfig %}
config.resolver.assetExts.push('cjs')
{% endset %}
{{ add_setting('MetroConfigAddenum', metroConfig)}}
{% set AuthServiceImports %}
import { GoogleSignin } from '@react-native-google-signin/google-signin'
import auth from '@react-native-firebase/auth'

GoogleSignin.configure({ webClientId: '' })
{% endset %}
{{ add_setting('AuthServiceImports', AuthServiceImports) }}
{% set AuthServiceModification %}
async googleLogin() {
  await GoogleSignin.hasPlayServices({ showPlayServicesUpdateDialog: true })
  const { idToken } = await GoogleSignin.signIn()
  const googleCredential = auth.GoogleAuthProvider.credential(idToken)
  const res = await auth().signInWithCredential(googleCredential)
  AsyncStorage.setItem('token', JSON.stringify(idToken))
  AsyncStorage.setItem('user', JSON.stringify(res.user))
  return res
}
{% endset %}
{{ add_setting('AuthServiceAddenum', AuthServiceModification) }}
{% set bpr %}
import AuthService from '@services/auth.service'
{% endset %}
{{ save_delayed('bpr',bpr)}}
AuthService.googleLogin().then((res) => {
  {{ content | raw }}
})