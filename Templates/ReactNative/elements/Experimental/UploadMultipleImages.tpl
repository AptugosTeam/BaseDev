/*
path: UploadMultipleImages.tpl
completePath: elements/Experimental/UploadMultipleImages.tpl
type: file
unique_id: AcXumHAq
icon: file.svg
helpText: Allows you to upload multiple image files by selection or drag and drop
options:
  - name: classname
    display: ClassName
    type: text
    options: ''
  - name: value
    display: Initial Value
    type: text
    options: ''
  - name: onChange
    display: On Change
    type: text
    options: ''
  - name: innerText
    display: Text for dropzone
    type: text
    options: ''
    default: "Drag 'n' drop some files here, or click to select files"
  - name: permissionText
    display: Reason Text
    type: text
    options: ''
settings:
  - name: Packages
    value: '"expo-image-picker": "^17.0.8",'
children: []
*/
{% set AppJsonPlugins %}
[
  "expo-image-picker",
  {
    "photosPermission": "{{ element.values.permissionText|default("The app accesses your photos to let you share them with your friends.")}}"
  }
],
{% endset %}
{{ add_setting('AppJsonIos', AppJsonIos)}}
{% set bpr %}
import { TouchableOpacity } from 'react-native'
{% endset %}
{{ save_delayed('bpr', bpr) }}
{% set bpr %}
import * as ImagePicker from 'expo-image-picker'
{% endset %}
{{ save_delayed('bpr', bpr) }}
{% set ph %}
const [image, setImage] = React.useState(null)
const openImagePickerAsync = async () => {
  let permissionResult = await ImagePicker.requestMediaLibraryPermissionsAsync()
    if (permissionResult.granted === false) {
      alert('Permission to access camera roll is required!')
      return
    }

    let pickerResult = await ImagePicker.launchImageLibraryAsync()
    setEventsdata({ ...Eventsdata, MediaFiles: [ ...Eventsdata.MediaFiles, {
      Type: 1,
      Url: {
        uri: pickerResult.uri,
        name: pickerResult.uri.substr(pickerResult.uri.lastIndexOf('/') + 1),
        type: `image/${pickerResult.uri.substr(pickerResult.uri.lastIndexOf('.') + 1)}`,
      },
      Name: pickerResult.uri.substr(pickerResult.uri.lastIndexOf('/') + 1)
    } ]})
}
{% endset %}
{{ save_delayed('ph',ph) }}
<TouchableOpacity onPress={openImagePickerAsync} {% if element.values.classname %}style={ {{ element.values.classname }} }{% endif %}>
  {% if element.children %}{% for child in element.children %}{{ child.rendered | raw }}{% endfor %}
  {% elseif not element.children %}
  <Text {% if element.values.classname %}style={ {{ element.values.classname ~ 'text' }} }{% endif %}>{{ element.values.innerText | default('Pick a Photo') }}</Text>
  {% endif %}
</TouchableOpacity>