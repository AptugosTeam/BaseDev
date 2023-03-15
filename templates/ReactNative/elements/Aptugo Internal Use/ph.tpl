/*
path: ph.tpl
completePath: elements/Aptugo Internal Use/ph.tpl
unique_id: D10wnZ8z
*/
{% set bpr %}
import { Provider as PaperProvider } from 'react-native-paper'
import { SafeAreaView } from 'react-native'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% set bpr %}
import { StyleSheet, Platform, StatusBar } from 'react-native'
const sc = StyleSheet.create({
  droidSafeArea: {
    flex: 1,
    paddingTop: Platform.OS === 'android' ? StatusBar.currentHeight : 0
  }
})
{% endset %}
{{ save_delayed('bpr',bpr)}}
const {{ page.name | friendly }} = (props) => {
  const { navigation } = props
  const { params } = props.route
  {% for delay in delayed %}
    {{ delay }}
  {% endfor %}
  {{ content|raw }}
  return (<PaperProvider><SafeAreaView style={sc.droidSafeArea}>
