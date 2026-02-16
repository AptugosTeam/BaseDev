/*
path: FileUpload.tsx
unique_id: QZm2nTtL
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
import React, { useState } from 'react'
import { Button, Image, View } from 'react-native'
import * as ImagePicker from 'expo-image-picker'

export default function ImagePickerExample(props) {
  const [image, setImage] = useState<any>(null);

  const pickImage = async () => {
    let result = await ImagePicker.launchImageLibraryAsync({
      mediaTypes: ImagePicker.MediaTypeOptions.Images,
      allowsEditing: true,
      aspect: [4, 3],
      quality: 1,
    })

    if (!result.canceled) {
      setImage(result.assets[0].uri)
      let localAsset = result.assets[0]
      let localUri = localAsset.uri
      let filename = localUri.split('/').pop()
      let match = /\.(\w+)$/.exec(filename)
      let type = match ? `image/${match[1]}` : `image`
      if (props.onChange) props.onChange({ uri: localUri, name: filename, type })
    }
  }

  return (
    <View style={ { flex: 0, alignItems: 'center', justifyContent: 'center' }}>
      <Button title="Pick an image from camera roll" onPress={pickImage} />
      {image && <Image source={ { uri: image }} style={ { width: 200, height: 200 }} />}
    </View>
  );
}