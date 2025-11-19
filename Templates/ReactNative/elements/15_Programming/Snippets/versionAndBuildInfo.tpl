/*
path: versionAndBuildInfo.tpl
keyPath: elements/15_Programming/Snippets/versionAndBuildInfo.tpl
unique_id: 6rUXkVV3
options:
  - name: classname
    display: ClassName
    type: text
    options: ''
*/
{% set bpr %}
import { Text } from 'react-native'
import Constants from 'expo-constants'

const version = Constants.expoConfig?.version
const buildNumber = Constants.expoConfig?.ios?.buildNumber || Constants.expoConfig?.android?.versionCode
const isDev = __DEV__
{% endset %}
{{ save_delayed('bpr',bpr)}}
<Text {% if element.values.classname %}style={ {{ element.values.classname }} }{%endif%}>
  Version {version} ({buildNumber}) — {isDev ? 'Development' : 'Production'}
</Text>