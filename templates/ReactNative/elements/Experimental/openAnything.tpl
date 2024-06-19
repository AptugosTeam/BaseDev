/*
path: openAnything.tpl
completePath: >-
  /Users/ari/Aptugo/BaseDev/templates/templates/ReactNative/elements/Experimental/openAnything.tpl
keyPath: elements/Experimental/openAnything.tpl
unique_id: e0dply6G
*/

{% set bpr %}
import * as OpenAnything from 'react-native-openanything';
import { Button } from 'react-native-paper';
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Button
  {% if element.values.className %}style={ {{ element.values.className }} }{% endif %}
  {% if element.values.labelStyle %}labelStyle={ {{ element.values.labelStyle }} }{% endif %}
  {% if element.values.Action %}onPress={ (e) => OpenAnything.{{ element.values.Action }}({{ element.values.Variable }}) }{% endif %}
  {% if element.values.icon %}icon={ '{{ element.values.icon }}' }{% endif %}
>{% if element.values.ButtonText %}{{ element.values.ButtonText }}{% endif %}{{ content | raw }}</Button>