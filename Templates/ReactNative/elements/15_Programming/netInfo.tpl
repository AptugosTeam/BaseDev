/*
path: netInfo.tpl
completePath: elements/Programming/netInfo.tpl
type: file
display: Network Info
unique_id: netInfo
icon: ico-use-state
helpText: Allows you to get information about connection type and connection quality
children: []
options:
  - name: addEvent
    display: Add Event Listener
    type: checkbox
    settings:
      default: false
  - name: body
    display: Body
    type: code
settings:
  - name: Packages
    value: '"@react-native-community/netinfo": "^11.4.1",'
*/
{% set bpr %}import NetInfo from '@react-native-community/netinfo'{% endset %}{{ save_delayed('bpr',bpr)}}

{% if element.values.addEvent %}
const unsubscribe = NetInfo.addEventListener((state) => {
      {{ element.values.body }}
      {{ content | raw }}
})
{% else %}
NetInfo.fetch().then((state) => {
    {{ element.values.body }}
    {{ content | raw }}
})
{% endif %}