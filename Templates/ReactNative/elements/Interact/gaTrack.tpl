/*
path: gaTrack.tpl
type: file
unique_id: VpU3zfJa
icon: ico-ga-track
helpText: Send a Google Analytics event with a category and action
options:
  - name: category
    display: Category
    helpText: High-level group used to classify the tracked event
    type: text
    options: ''
  - name: action
    display: Action
    helpText: Specific interaction or event name to record
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
