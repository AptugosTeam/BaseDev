/*
path: InCallManager.tpl
keyPath: elements/15_Programming/Snippets/InCallManager.tpl
unique_id: BJJyTZOn
options:
  - name: waitforvar
    display: Wait for variable
    type: text
    options: ''
settings:
  - name: Packages
    value: '"react-native-incall-manager": "^4.2.1",'
*/
{% set bpr %}
import { useEffect } from 'react'
import InCallManager from 'react-native-incall-manager'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set ph %}
useEffect(() => {
  {% if element.values.waitforvar %}if ({{ element.values.waitforvar }}) { {% endif %}
  InCallManager.start({ media: 'audio' })
  InCallManager.setForceSpeakerphoneOn(true)
return () => {
    InCallManager.stop()
  }
  {% if element.values.waitforvar %} } {% endif %}
}, [{{ element.values.waitforvar }}])
{% endset %}
{{ save_delayed('ph', ph) }}