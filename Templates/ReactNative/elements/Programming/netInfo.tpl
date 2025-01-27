/*
path: netInfo.tpl
completePath: elements/Programming/netInfo.tpl
type: file
display: Network Info
unique_id: netInfo
icon: ico-use-state
helpText: Allows you to get information about connection type and connection quality
children: []
settings:
  - name: Packages
    value: '"@react-native-community/netinfo": "^11.4.1",'
*/
{% set bpr %}import NetInfo from '@react-native-community/netinfo'{% endset %}{{ save_delayed('bpr',bpr)}}

NetInfo.fetch().then((state) => {
    {{ content | raw }}
})