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
  - name: ButtonText
    display: Button Text to display
    type: text
    options: ''
    settings:
      default: Button
  - name: Action
    display: Action
    type: dropdown
    options: Pdf
  - name: Variable
    display: Variable to use
    type: text
    options: ''
  - name: className
    display: ClassName
    type: text
    options: ''
  - name: labelStyle
    display: ClassName for Label
    type: text
    options: ''
  - name: icon
    display: Write the name of an icon
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
  {% if element.values.labelStyle %}labelStyle={ {{ element.values.labelStyle }} }{% endif %}
  {% if element.values.Action %}onPress={ (e) => OpenAnything.{{ element.values.Action }}({{ element.values.Variable }}) }{% endif %}
  {% if element.values.icon %}icon={ '{{ element.values.icon }}' }{% endif %}
>{% if element.values.ButtonText %}{{ element.values.ButtonText }}{% endif %}{{ content | raw }}</Button>