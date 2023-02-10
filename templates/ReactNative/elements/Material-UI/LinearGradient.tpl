/*
path: LinearGradient.tpl
type: file
unique_id: hdalkyeA
icon: ico-button
options: []
sourceType: javascript
children: []
settings: 
  - name: Packages
    value: '"expo-linear-gradient": "^12.0.1",'
*/

{% set bpr %}
import { LinearGradient } from 'expo-linear-gradient';
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<LinearGradient
        colors={['#424361', '#30314D']}
        locations={[0, 0.9]}
      >
      {{ content | raw }}
      </LinearGradient>