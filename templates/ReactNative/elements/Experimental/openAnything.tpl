/*
path: openAnything.tpl
type: file
completePath: elements/Experimental/openAnything.tpl
unique_id: openAnyting069
icon: ico-field
settings:
  - name: Packages
    value: '"react-native-openanything"'
options:
  - name: Action
    display: Action
    type: dropdown
    options: pdf
  - name: Variable
    display: Variable to use
    type: text
    options: ''
  - name: className
    display: ClassName
    type: text
    options: ''
children: []
*/
{% set bpr %}
import * as OpenAnything from 'react-native-openanything';
import { Button } from 'react-native-paper';
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Button
  {% if element.values.className %}style={ {{ element.values.className }} }{% endif %}
  {% if element.values.Action %}onPress={ () => OpenAnything.{{ element.values.Action }}({{ element.values.Variable }}) }{% endif %}
>{{ content | raw }}</Button>
