/*
path: deviceBrand.tpl
keyPath: elements/Programming/Snippets/deviceBrand.tpl
unique_id: N36dI9uG
settings:
  - name: Packages
    value: '"expo-device": "~5.4.0",'
*/
{% set bpr %}
import * as Device from 'expo-device'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{Device.brand === 'Apple' && 
  {{ content | raw }}
}