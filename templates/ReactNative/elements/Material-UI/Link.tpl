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
children: []
*/
{% set bpr %}
import { Button } from 'react-native-paper'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<Button
  key='{{ element.unique_id }}'
  {% if element.values.innerText %}title={{ element.values.innerText|textOrVariable }}{% endif %}
  onPress={() => navigation.push( `{{ element.values.destination }}` )}
>
  {{ content | raw }}
</Button>