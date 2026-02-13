/*
path: gaTrack.tpl
type: file
unique_id: VpU3zfJa
icon: ico-ga-track
options:
  - name: category
    display: Category
    type: text
    options: ''
  - name: action
    display: Action
    type: text
    options: ''
sourceType: javascript
settings:
  - name: Packages
    value: '"react-ga": "^3.3.0",'
children: []
*/
{% set bpr %}
import ReactGA from 'react-ga'
{% endset %}
{{ save_delayed('bpr',bpr) }}
ReactGA.event({
  category: "{{ element.values.category }}",
  action: "{{ element.values.action }}",
});
