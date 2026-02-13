/*
path: BottomSheet.tpl
keyPath: elements/15_Programming/Snippets/BottomSheet.tpl
unique_id: hcX8mgrV
options:
  - name: snappoints
    display: Snap Points
    type: text
    options: ''
    settings:
      default: "['1%', '40%']"
  - name: onChange
    display: On Change
    type: function
    options: ''
  - name: refName
    display: Reference Name
    type: text
    options: ''
    advanced: true
    settings:
      default: "bottomSheetRef"
  - name: donotref
    display: Do not define ref
    type: checkbox
    advanced: true
  - name: startingIndex
    display: Starting Index
    type: text
    advanced: true
  - name: hideHandle
    display: Hide Handle
    advanced: true
    type: checkbox
settings:
  - name: Packages
    value: '"@gorhom/bottom-sheet": "^5.2.6",'
*/
{% set bpr %}
import BottomSheet, { BottomSheetView } from '@gorhom/bottom-sheet'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% if not element.values.donotref %}
  {% set ph %}
    const {{ element.values.refName|default('bottomSheetRef') }} = React.useRef<BottomSheet>(null)
  {% endset %}
  {{ save_delayed('ph',ph)}}
{% endif %}
<BottomSheet
  ref={ {{ element.values.refName }} }
  snapPoints={ {{ element.values.snappoints|default("['1%', '40%']")}} }
  {% if element.values.startingIndex %}index={{ element.values.startingIndex | textOrVariable }}{% endif %}
  {% if element.values.onChange %}onChange={ {{ element.values.onChange | functionOrCall }} }{% endif %}
  {% if element.values.hideHandle %}handleComponent={() => { return <></> }}{% endif %}
>
  <BottomSheetView>
    {{ content | raw }}
  </BottomSheetView>
</BottomSheet>