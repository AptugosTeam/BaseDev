/*
path: appleLogin.tpl
completePath: >-
  /Users/gastongorosterrazu/Aptugo/BaseDev/templates/ReactNative/elements/Interact/appleLogin.tpl
keyPath: elements/Interact/appleLogin.tpl
unique_id: zo8Ko18x
settings:
  - name: Packages
    value: '"expo-apple-authentication": "~6.1.0",'
*/
{% set AppJsonAndroid %}"googleServicesFile": "./google-services.json",{% endset %}
{{ add_setting('AppJsonAndroid', AppJsonAndroid)}}
{% set AppJsonIos %}"googleServicesFile": "./GoogleService-Info.plist",{% endset %}
{{ add_setting('AppJsonIos', AppJsonIos)}}
{% set AppJsonPlugins %}"expo-apple-authentication",{% endset %}
{{ add_setting('AppJsonPlugins', AppJsonPlugins)}}
{% set AuthServiceImports %}
import * as AppleAuthentication from 'expo-apple-authentication'
{% endset %}
{{ add_setting('AuthServiceImports', AuthServiceImports) }}
{% set AuthServiceModification %}
async appleLogin() {
  const credential = await AppleAuthentication.signInAsync({
    requestedScopes: [AppleAuthentication.AppleAuthenticationScope.FULL_NAME, AppleAuthentication.AppleAuthenticationScope.EMAIL],
  })

  const { identityToken } = credential;
  const appleCredential = auth.AppleAuthProvider.credential(identityToken);
  const res = await auth().signInWithCredential(appleCredential)
  AsyncStorage.setItem('token', JSON.stringify(identityToken))
  AsyncStorage.setItem('user', JSON.stringify(res.user))
  return res
}
{% endset %}
{{ add_setting('AuthServiceAddenum', AuthServiceModification) }}
{% set bpr %}
import AuthService from '../services/auth.service'
{% endset %}
{{ save_delayed('bpr',bpr)}}
AuthService.appleLogin().then((res) => {
  {{ content | raw }}
})