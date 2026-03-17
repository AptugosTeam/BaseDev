/*
path: pannellumVideo.tpl
type: file
unique_id: EEdcMiChq
icon: f:pannellumIcon.svg
double: true
order: 1
helpText: virtual video view with the panellum library
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
  - name: video
    display: ​video Route
    type: text
    options: ''
  - name: loop
    display: Looping over video
    type: checkbox
    options: ''
  - name: controls
    display: showing controls under
    type: checkbox
    options: ''
  - name: muted
    display: making video mute
    type: checkbox
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
  - name: autoRotate
    display: Rotation speed (Number)
    type: text
    options: ''
    advanced: true
  - name: mouseZoom
    display: disable zoom control with mouse
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
import { Pannellum, PannellumVideo } from 'pannellum-react'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<PannellumVideo
    {% if element.values.width %}width={" {{element.values.width}} "}{% else %}width={"50%"}{% endif %}
    {% if element.values.height %}height={" {{element.values.height}} "}{% else %}height={"400px"}{% endif %}
    {% if element.values.video %}video={ {{element.values.video}} }{% else %}video={"https://pannellum.org/images/video/jfk.webm"}{% endif %}
    {% if element.values.pitch %}pitch={ {{element.values.pitch}} }{% else %}pitch={0}{% endif %}
    {% if element.values.maxPitch %}maxPitch={ {{element.values.maxPitch}} }{% else %}maxPitch={90}{% endif %}
    {% if element.values.minPitch %}minPitch={ {{element.values.minPitch}} }{% else %}minPitch={-90}{% endif %}
    {% if element.values.yaw %}yaw={ {{element.values.yaw}} }{% else %}yaw={0}{% endif %}
    {% if element.values.hfov %}hfov={ {{element.values.hfov}} }{% else %}hfov={0}{% endif %}
    {% if element.values.maxHfov %}maxHfov={ {{element.values.maxHfov}} }{% else %}maxHfov={150}{% endif %}
    {% if element.values.minHfov %}minHfov={ {{element.values.minHfov}} }{% else %}minHfov={50}{% endif %}
    {% if element.values.autoRotate %}autoRotate={ {{element.values.autoRotate}} }{% else %}autoRotate={0}{% endif %}
    {% if element.values.mouseZoom %}mouseZoom={false}{% else %}mouseZoom={true}{% endif %}
    {% if element.values.loop %}loop={false}{% else %}loop={true}{% endif %}
    {% if element.values.controls %}controls={true}{% else %}controls={false}{% endif %}
    {% if element.values.muted %}muted={false}{% else %}muted={true}{% endif %}
>
{{ content | raw }}
</PannellumVideo>
