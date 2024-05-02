/*
path: UploadImage.tpl
completePath: elements/Experimental/UploadImage.tpl
type: file
unique_id: UIXcm47q
icon: file.svg
helpText: Allows you to upload a single image file
options:
  - name: classname
    display: ClassName
    type: text
    options: ''
  - name: value
    display: Value
    type: text
    options: ''
  - name: permissionResultGrantedDenied
    display: Permission Result Granted Denied Message
    type: text
    options: ''
  - name: pickerResultCanceled
    display: Picker Result Canceled Message
    type: text
    options: ''
  - name: innerText
    display: Text for dropzone
    type: text
    options: ''
    default: "Drag 'n' drop some files here, or click to select files"
settings:
  - name: Packages
    value: '"expo-image-picker": "~14.3.2",'
children: []
*/
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

    if (!permissionResult.granted) {
      {% if element.values.permissionResultGrantedDenied %}
      {{element.values.permissionResultGrantedDenied}}
      {% elseif not element.values.permissionResultGrantedDenied %}
      alert('Permission to access camera roll is required!')
      {% endif %}
      return
    }

    let pickerResult = await ImagePicker.launchImageLibraryAsync()
    if (pickerResult.canceled) {
      {% if element.values.pickerResultCanceled %}
      {{element.values.pickerResultCanceled}}
      {% elseif not element.values.pickerResultCanceled %}
      alert('Image picker was cancelled')
      {% endif %}
      return
    }

    let selectedImage = pickerResult.assets[0]
    let filename = selectedImage.uri.split('/').pop()
    let response = await fetch(selectedImage.uri)
    let blob = await response.blob()
    setImage({
      uri: selectedImage.uri,
      name: filename,
      type: selectedImage.type,
      blob: blob,
    })
  }
  {% if element.values.value %}
  React.useEffect(() => {
    if (image) {
        {{element.values.value}}
    }
  }, [image])
  {% endif %}
{% endset %}
{{ save_delayed('ph',ph) }}
<TouchableOpacity onPress={openImagePickerAsync} {% if element.values.classname %}style={ {{ element.values.classname }} }{% endif %}>
  {% if element.children %}{% for child in element.children %}{{ child.rendered | raw }}{% endfor %}
  {% elseif not element.children %}
  <Text {% if element.values.classname %}style={ {{ element.values.classname ~ 'text' }} }{% endif %}>{{ element.values.innerText | default('Pick a Photo') }}</Text>
  {% endif %}
</TouchableOpacity>