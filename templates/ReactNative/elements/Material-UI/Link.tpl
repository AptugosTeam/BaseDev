/*
path: Link.tpl
type: file
unique_id: a0bW4rmi
icon: ico-link
helpText: Simple Link that uses React Router
options:
  - name: innerText
    display: Text
    type: text
    options: ''
  - name: destination
    display: Destination
    type: text
    options: ''
  - name: parameters
    display: Parameters
    type: text
    options: ''
children: []
*/
{% set bpr %}
import { TouchableOpacity } from "react-native"
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<TouchableOpacity
  key='{{ element.unique_id }}'
  onPress={() => navigation.push( `{{ element.values.destination }}`{% if element.values.parameters %}, { {{ element.values.parameters }} }{%endif%} )}  
>
{% if element.values.innerText %}title={{ element.values.innerText|textOrVariable }}{% endif %}
{{ content | raw }}
</TouchableOpacity>