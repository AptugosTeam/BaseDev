/*
path: backHandler.tpl
type: file
unique_id: rCl7agO5a069
icon: ico-check-box
options:
sourceType: javascript
children: []
settings:
  - name: Packages
    value: '"react-navigation-backhandler": "latest",'
*/
{% set bpr %}
  import {useAndroidBackHandler} from 'react-navigation-backhandler'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set ph %}
 useAndroidBackHandler(() => {
    return true
  })
{% endset %}
{{ save_delayed('ph',ph) }}
