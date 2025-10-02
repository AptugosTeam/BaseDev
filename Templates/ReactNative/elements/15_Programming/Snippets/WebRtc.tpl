/*
path: WebRtc.tpl
keyPath: elements/15_Programming/Snippets/WebRtc.tpl
unique_id: tTcK4Rth
settings:
  - name: Packages
    value: '"@config-plugins/react-native-webrtc": "^13.0.0","react-native-webrtc": "^124.0.6","react-native-worklets": "0.5.1",'
*/
{% set AppJsonPlugins %}
[
  "@config-plugins/react-native-webrtc",
  {
    "microphonePermission": "Allow $(PRODUCT_NAME) to access your microphone"
  }
],
{% endset %}
{{ add_setting('AppJsonPlugins', AppJsonPlugins)}}

{% set bpr %}
import { RTCPeerConnection, mediaDevices } from 'react-native-webrtc'{% endset %}
{{ save_delayed('bpr',bpr) }}