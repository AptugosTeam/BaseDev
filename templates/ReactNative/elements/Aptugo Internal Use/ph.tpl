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
const {{ page.name | friendly }} = ({ navigation }) => {
  {% for delay in delayed %}
    {{ delay }}
  {% endfor %}
  {{ content|raw }}
  return (<PaperProvider><SafeAreaView style={theme.safeArea}>
