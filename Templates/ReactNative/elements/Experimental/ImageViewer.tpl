/*
path: ImageViewer.tpl
keyPath: elements/Experimental/ImageViewer.tpl
unique_id: aqUNmA4K
options:
  - name: urls
    display: Image URL(s)
    type: text
    options: ''
  - name: swipeDown
    display: Enable Swipe Down
    type: checkbox
    options: ''
  - name: onSwipeDown
    display: On Swipe Down
    type: code
    options: ''
  - name: onClose
    display: On Close
    type: code
  - name: backgroundColor
    display: Background Color
    type: text
settings:
  - name: Packages
    value: '"react-native-image-zoom-viewer": "^3.0.1",'
*/
{% set bpr %}
import ImageViewer from 'react-native-image-zoom-viewer'
{% endset %}
{{ save_delayed('bpr',bpr)}}
<ImageViewer
  imageUrls={[{{ element.values.urls }}]}
  {% if element.values.swipeDown %}
    enableSwipeDown={true}
    {% if element.values.onSwipeDown %}onSwipeDown={ {{ element.values.onSwipeDown | functionOrCall }} }{% endif %}
  {% endif %}
  onCancel={ {{ element.values.onClose | functionOrCall }} }
  {% if element.values.backgroundColor %}backgroundColor={{ element.values.backgroundColor | textOrVariable }}{% endif %}
/>