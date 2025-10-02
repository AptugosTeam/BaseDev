/*
path: InCallManager.tpl
keyPath: elements/15_Programming/Snippets/InCallManager.tpl
unique_id: BJJyTZOn
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
  InCallManager.start({ media: 'audio' })
  InCallManager.setForceSpeakerphoneOn(true)
  return () => {
    InCallManager.stop()
  }
}, [])
{% endset %}
{{ save_delayed('ph', ph) }}