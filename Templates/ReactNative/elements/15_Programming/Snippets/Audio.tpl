/*
path: Audio.tpl
keyPath: elements/15_Programming/Snippets/Audio.tpl
unique_id: qyTf1I4L
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
  - name: endpoint
    display: Where to send the audio? (endpoint)
    type: url
settings:
  - name: Packages
    value: '"expo-av": "~16.0.7",'
*/
{% set bpr %}
import { Audio } from 'expo-av'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set sound = element.values.soundStateName | default('sound') %}
{% set isRecording = element.values.isRecordingStateName | default('isRecording') %}
{% set recording = element.values.recordingStateName | default('recording') %}
{% include includeTemplate('useState.tpl') with { 'element': { 'values': { variableName: recording , typeAnnotation: 'Audio.Recording | null', defaultValue: 'null' }}} %}
{% include includeTemplate('useState.tpl') with { 'element': { 'values': { variableName: isRecording , defaultValue: 'false' }}} %}
{% include includeTemplate('useState.tpl') with { 'element': { 'values': { variableName: sound, typeAnnotation: 'Audio.Sound | null', defaultValue: 'null' }}} %}
{% include includeTemplate('useState.tpl') with { 'element': { 'values': { variableName: 'isProcessingAudio', defaultValue: 'false' }}} %}

const startRecording = async () => {
  try {
    await Audio.requestPermissionsAsync()
    await Audio.setAudioModeAsync({
      allowsRecordingIOS: true,
      playsInSilentModeIOS: true,
    })

    const { recording } = await Audio.Recording.createAsync(
      Audio.RecordingOptionsPresets.HIGH_QUALITY,
    )
    set{{ recording }}(recording)
    set{{ isRecording }}(true)
  } catch (err) {
    console.error('Failed to start recording', err)
  }
}

const stopRecording = async (params = {}) => {
  if (!recording) return
  set{{ isRecording }}(false)
  await recording.stopAndUnloadAsync()
  const uri = recording.getURI()
  set{{ recording }}(null)

  const formData = new FormData()
  formData.append('file', {
    uri,
    type: 'audio/m4a',
    name: `voice-${Date.now()}.m4a`,
  } as any)
    
  Object.keys(params).forEach(key => {
    formData.append(key, params[key])
  })

  if (receiver) {
    formData.append('to', receiver)
  }

  setisProcessingAudio(true)
  axios
    .post({{ element.values.endpoint | textOrVariableInCode }}, formData, {
      headers: { 'Content-Type': 'multipart/form-data' },
    })
    .then((result) => {
      setmessageHistory((old) => [...old, { from: 'User', type: 'audio', message: result.data.message, file: result.data.fileUrl, when: new Date() }])
      if (onSendMessage) onSendMessage({ from: 'User', type: 'audioMessage', message: result.data.message, file: result.data.fileUrl, when: new Date() })
    })
    .catch((error) => {
      setmessageHistory((old) => [...old, { from: 'User', type: 'text', message: 'Bad message - Not sent', when: new Date() }])
    })
    .finally(() => {
      setisProcessingAudio(false)
    })
}