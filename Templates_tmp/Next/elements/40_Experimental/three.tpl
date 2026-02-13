/*
path: three.tpl
keyPath: elements/40_Experimental/three.js
unique_id: WbOTUxWB
settings:
  - name: Packages
    value: '"three": "^0.180.0",'
*/
{% set bpr %}
import * as THREE from 'three'
{% endset %}
{{ save_delayed('bpr',bpr) }}
