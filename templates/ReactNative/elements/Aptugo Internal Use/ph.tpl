/*
path: ph.tpl
completePath: elements/Aptugo Internal Use/ph.tpl
unique_id: D10wnZ8z
options:
  - name: style
    display: Styles
    type: code
    options: ''
    advanced: true
*/
{% set bpr %}
import { Provider as PaperProvider } from 'react-native-paper'
import { SafeAreaProvider } from 'react-native-safe-area-context'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% set bpr %}
import { StyleSheet, Platform, StatusBar } from 'react-native'
const sc  = StyleSheet.create({
  droidSafeArea: {
    {% if element.values.style %}
    {{element.values.style}}
    {% else %}
    flex: 1,
    paddingTop: Platform.OS === 'android' ? StatusBar.currentHeight : 0
    {% endif %}
  }
})
{% endset %}
{{ save_delayed('bpr',bpr)}}
const {{ page.name | friendly }} = (props) => {
  const { navigation:router } = props
  const { params } = props.route
  {% for delay in delayed %}
    {{ delay }}
  {% endfor %}
  {{ content|raw }}
  return (<PaperProvider><SafeAreaProvider style={sc.droidSafeArea}>
