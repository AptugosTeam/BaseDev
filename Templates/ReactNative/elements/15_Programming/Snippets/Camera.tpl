/*
path: Camera.tpl
keyPath: elements/15_Programming/Snippets/Camera.tpl
unique_id: EhM2h53m
options:
  - name: recordingStateName
    display: Recording Variable Name
    type: text
    settings:
      default: 'recording'
  - name: isRecordingStateName
    display: Is Recording Variable Name
    type: text
    settings:
      default: 'isRecording'
  - name: soundStateName
    display: Sound Variable Name
    type: text
    settings:
      default: 'sound'
  - name: facing
    display: Facing?
    type: text
    settings:
      default: 'front'
  - name: endpoint
    display: Where to send the photos? (endpoint)
    type: url
  - name: quality
    type: text
    settings:
      default: '0.8'
  - name: className
    display: ClassName
    type: text
    options: ''
settings:
  - name: Packages
    value: '"expo-camera": "^17.0.8",'
*/
{% set bpr %}
import { CameraView, useCameraPermissions } from 'expo-camera'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% set ph %}
  const [isCameraOpen, setIsCameraOpen] = React.useState(false)
  const [isProcessingPicture, setisProcessingPicture] = React.useState<any>(false)
  const cameraRef = React.useRef<any>(null)
  const [permission, requestPermission] = useCameraPermissions()
  {% if element.children %}
    {{ content | raw }}
  {% else %}
    const takePhoto = async (params = {}) => {
      if (cameraRef.current) {
        setisProcessingPicture(true)
        const photo = await cameraRef.current.takePictureAsync({ quality: {{ element.values.quality | default('0.8') }} })
        setIsCameraOpen(false)

        const formData = new FormData()
        formData.append('file', {
          uri: photo.uri,
          type: 'image/jpeg',
          name: 'photo.jpg',
        } as any)

        Object.keys(params).forEach(key => {
          formData.append(key, params[key])
        })

        if (receiver) {
          formData.append('to', receiver)
        }
        
        try {
          const response = await axios.post(
            {{ element.values.endpoint | textOrVariableInCode }},
            formData,
            { headers: { 'Content-Type': 'multipart/form-data' } }
          )

          setisProcessingPicture(false)
          if (response.data?.fileUrl) {
            const newMessage:any = { from: 'User', file: response.data.fileUrl, message: response.data.fileUrl, type: 'photo', when: new Date() }
            if (receiver) newMessage.to = receiver
            setmessageHistory((old) => [...old, newMessage])
            if (onSendMessage) onSendMessage({ ...newMessage, type: 'photoMessage' })
          } else {
            setmessageHistory((old) => [...old, { from: 'User', message: response.data.message, type: 'message', when: new Date() }])
          }
        } catch (err) {
          console.error('Upload failed:', err)
        }
      }
    }
  {% endif %}
{% endset %}
{{ save_delayed('ph',ph)}}
<CameraView
  ref={cameraRef}
  facing={{ element.values.facing|default('front')|textOrVariable}}
  {% if element.values.className %}style={ {{ element.values.className }} }
  {% else %}style={ { flex: 1, position: 'absolute', top: 0, bottom: 0, left: 0, right: 0 } }{% endif %}
/>