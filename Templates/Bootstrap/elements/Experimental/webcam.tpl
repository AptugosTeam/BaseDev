/*
path: webcam.tpl
type: file
unique_id: webcambpk
icon: f:webcam.svg
sourceType: javascript
settings:
  - name: Packages
    value: '"react-webcam": "latest",'
options:
  - name: width
    display: Width
    type: text
    settings:
      active: true
      default: '1280'
  - name: height
    display: Height
    type: text
    settings:
      active: true
      default: '720'
  - name: facing
    display: Facing Mode
    type: dropdown
    options: return [['user','User/Selfie'],['environment','Environment/Facing-out']]
    settings:
      active: true
      default: 'user'
children: []
*/
{% set bpr %}
import Webcam from 'react-webcam'
{% endset %}
{{ save_delayed('bpr', bpr) }}
{% set ph %}
const webcamRef = React.useRef(null)
const capture = React.useCallback(() => {
  const imageSrc = webcamRef.current.getScreenshot()
  {{ content | raw }}
},[webcamRef])
{% endset %}
{{ save_delayed('ph', ph) }}
<Webcam
  audio={false}
  width={ {{ element.values.width| default('1280') }} }
  height={ {{ element.values.height | default('720') }} }
  ref={webcamRef}
  screenshotFormat="image/jpeg"
  videoConstraints={ {
    width: {{ element.values.width| default('1280') }},
    height: {{ element.values.height | default('720') }},
    facingMode: {{ element.values.facing | default('user') | textOrVariable }}
  } }
/>
<button onClick={capture}>Capture photo</button>