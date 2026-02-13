/*
path: WebRtc.tpl
keyPath: elements/15_Programming/Snippets/WebRtc.tpl
unique_id: tTcK4Rth
options:
  - name: className
    display: ClassName
    type: text
    options: ''
  - name: permissionText
    display: Reason Text
    type: text
    options: ''
  - name: streamurl
    display: Stream URL
    type: text
    options: ''
  - name: mirror
    display: Mirror Stream?
    type: checkbox
    options: ''
settings:
  - name: Packages
    value: '"@config-plugins/react-native-webrtc": "^13.0.0","react-native-webrtc": "^124.0.6","react-native-worklets": "0.5.1",'
*/
{% set AppJsonPlugins %}
[
  "@config-plugins/react-native-webrtc",
  {
    "microphonePermission": "{{ element.values.permissionText|default("Allow $(PRODUCT_NAME) to access your microphone")}}"
  }
],
{% endset %}
{{ add_setting('AppJsonPlugins', AppJsonPlugins)}}

{% set bpr %}
import { RTCPeerConnection, mediaDevices, RTCView } from 'react-native-webrtc'{% endset %}
{{ save_delayed('bpr',bpr) }}
{% if element.values.streamurl %}
<RTCView
  streamURL={{ element.values.streamurl | textOrVariable }}
  objectFit="cover"
  {% if element.values.className is not empty %}style={ {{element.values.className}} }{% endif %}
  {% if element.values.mirror %}mirror={true}{% endif %}
/>
{% endif %}