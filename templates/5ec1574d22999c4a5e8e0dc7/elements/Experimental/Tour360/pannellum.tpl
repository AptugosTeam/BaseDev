/*
path: pannellum.tpl
type: file
unique_id: EEdcDaMrq
icon: f:pannellumIcon.svg
double: true
order: 1
helpText: virtual tour with the pannellum bookstore
sourceType: javascript
options:
  - name: width
    display: Width Panorama
    type: text
    options: ''
  - name: height
    display: Height Panorama
    type: text
    options: ''
  - name: image
    display: ​​Image Route
    type: text
    options: ''
  - name: SeparatorPitch
    display: vertical tilt (pitch)
    type: separator
  - name: pitch
    display: ​Vertical Inclination Angle (Number)
    type: text
    options: ''
  - name: maxPitch
    display: Maximum inclination of the field of view (Number)
    type: text
    options: ''
    advanced: true
  - name: minPitch
    display: Minimum field of view tilt(Number)
    type: text
    options: ''
    advanced: true
  - name: SeparatorYaw
    display: Horizontal camera rotation (Yaw)
    type: separator  
  - name: yaw
    display: Adjust Horizontal Rotation (Number)
    type: text
    options: ''
  - name: SeparatorHfov
    display: Camera horizontal field of view (Hfov)
    type: separator 
  - name: hfov
    display: Adjust Zoom Level (Number)
    type: text
    options: ''
  - name: maxHfov
    display: Maximum field of view (Number)
    type: text
    options: ''
    advanced: true
  - name: minHfov
    display: Minimum field of view (Number)
    type: text
    options: ''
    advanced: true
  - name: SeparatorText
    display: Panorama texts
    type: separator 
  - name: title
    display: Panorama Title
    type: text
    options: ''
  - name: author
    display: Author Of The Panorama
    type: text
    options: ''
  - name: autoRotate
    display: Rotation speed (Number)
    type: text
    options: ''
    advanced: true
  - name: compass
    display: activate compass(true or false)
    type: checkbox
    options: ''
    advanced: true
  - name: orientationOnByDefault
    display: gyroscope activation
    type: checkbox
    options: ''
    advanced: true
  - name: showZoomCtrl
    display: Display of zoom buttons
    type: checkbox
    options: ''
    advanced: true
  - name: keyboardZoom
    display: disable the zoom control
    type: checkbox
    options: ''
    advanced: true
  - name: disableKeyboardCtrl
    display: disable the control Keyboard
    type: checkbox
    options: ''
    advanced: true
  - name: mouseZoom
    display: disable zoom control with mouse
    type: checkbox
    options: ''
    advanced: true
  - name: draggable
    display: disable mouse dragging
    type: checkbox
    options: ''
    advanced: true
settings:
  - name: Packages
    value: '"pannellum-react": "^1.2.4",'
  - name: Packages
    value: '"buffer": "^6.0.3",'
children: []
*/
{% set bpr %}
import { Pannellum } from 'pannellum-react'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<Pannellum
    {% if element.values.width %}width={" {{element.values.width}} "}{% else %}width={"50%"}{% endif %}
    {% if element.values.height %}height={" {{element.values.height}} "}{% else %}height={"400px"}{% endif %}
    {% if element.values.image %}image={ {{element.values.image}} }{% else %}image={"https://pannellum.org/images/alma.jpg"}{% endif %}
    {% if element.values.pitch %}pitch={ {{element.values.pitch}} }{% else %}pitch={0}{% endif %}
    {% if element.values.maxPitch %}maxPitch={ {{element.values.maxPitch}} }{% else %}maxPitch={90}{% endif %}
    {% if element.values.minPitch %}minPitch={ {{element.values.minPitch}} }{% else %}minPitch={-90}{% endif %}
    {% if element.values.yaw %}yaw={ {{element.values.yaw}} }{% else %}yaw={0}{% endif %}
    {% if element.values.hfov %}hfov={ {{element.values.hfov}} }{% else %}hfov={0}{% endif %}
    {% if element.values.maxHfov %}maxHfov={ {{element.values.maxHfov}} }{% else %}maxHfov={150}{% endif %}
    {% if element.values.minHfov %}minHfov={ {{element.values.minHfov}} }{% else %}minHfov={50}{% endif %}
    {% if element.values.autoRotate %}autoRotate={ {{element.values.autoRotate}} }{% else %}autoRotate={0}{% endif %}
    {% if element.values.compass %}compass={true}{% else %}compass={false}{% endif %}
    {% if element.values.title %}title={" {{element.values.title}} "}{% endif %}
    {% if element.values.author %}author={" {{element.values.author}} "}{% endif %}
    {% if element.values.orientationOnByDefault %}orientationOnByDefault={true}{% else %}orientationOnByDefault={false}{% endif %}
    {% if element.values.showZoomCtrl %}showZoomCtrl={true}{% else %}showZoomCtrl={false}{% endif %}
    {% if element.values.keyboardZoom %}keyboardZoom={false}{% else %}keyboardZoom={true}{% endif %}
    {% if element.values.disableKeyboardCtrl %}disableKeyboardCtrl={true}{% else %}disableKeyboardCtrl={false}{% endif %}
    {% if element.values.mouseZoom %}mouseZoom={false}{% else %}mouseZoom={true}{% endif %}
    {% if element.values.draggable %}draggable={false}{% else %}draggable={true}{% endif %}
    autoLoad
    onLoad={() => {
        console.log('panorama loaded')
    }}
>
{{ content | raw }}
</Pannellum>
