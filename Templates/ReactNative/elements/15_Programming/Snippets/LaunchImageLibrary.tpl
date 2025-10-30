/*
path: LaunchImageLibrary.tpl
keyPath: elements/15_Programming/Snippets/LaunchImageLibrary.tpl
unique_id: 3UugNhBv
options:
  - name: permissionText
    display: Reason Text
    type: text
    options: ''
settings:
  - name: Packages
    value: '"expo-image-picker": "^17.0.8",'
*/
{% set AppJsonPlugins %}
[
  "expo-image-picker",
  {
    "photosPermission": "{{ element.values.permissionText|default("The app accesses your photos to let you share them with your friends.")}}"
  }
],
{% endset %}
{{ add_setting('AppJsonPlugins', AppJsonPlugins)}}
{% set bpr %}
import * as ImagePicker from 'expo-image-picker'
{% endset %}
{{ save_delayed('bpr', bpr)}}
await ImagePicker.launchImageLibraryAsync({
  mediaTypes: ImagePicker.MediaTypeOptions.Images,
  allowsEditing: true,
  aspect: [4, 3],
  quality: 0.75,
})