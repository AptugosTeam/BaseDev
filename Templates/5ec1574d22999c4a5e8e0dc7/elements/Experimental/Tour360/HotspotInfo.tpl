/*
path: HotspotInfo.tpl
type: file
unique_id: EEjgMaTrq
icon: f:HotspotIcon.svg
helpText: interactive information point within a panoramic image
sourceType: javascript
options:
  - name: type
    display: Specifies the type of action
    type: text
    options: ''
  - name: pitch
    display: ​Vertical Inclination Angle (Number)
    type: text
    options: ''
  - name: yaw
    display: Adjust Horizontal Rotation (Number)
    type: text
    options: '' 
  - name: textInformation
    display: text information
    type: text
    options: ''
  - name: URL
    display: Access Point (URL)
    type: text
    options: ''
*/
{% set bpr %}
import { Pannellum } from 'pannellum-react'
{% endset %}
{{ save_delayed('bpr', bpr) }}
  <Pannellum.Hotspot
    {% if element.values.type %}type={ {{element.values.type}} }{% else %}type={"custom"}{% endif %}
    {% if element.values.pitch %}pitch={ {{element.values.pitch}} }{% else %}pitch={0}{% endif %}
    yaw={ {{element.values.yaw|default("100")}} }
    {% if element.values.textInformation %}text={{ element.values.textInformation | textOrVariable }}{% endif %}
    {% if element.values.URL %}URL={" {{element.values.URL}} "}{% else %}URL={""}{% endif %} 
/>
  