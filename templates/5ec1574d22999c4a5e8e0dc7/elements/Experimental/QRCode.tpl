/*
path: QRCode.tpl
type: file
unique_id: BG98dEr8
icon: f:simpleLink.svg
options:
  - name: size
    display: Size
    type: text
  - name: style
    display: Extra Styles
    type: text
  - name: value
    display: Value
    type: text
  - name: id
    display: ID
    type: text
  - name: level
    display: level
    type: dropdown
    options: 
      return [['L', 'Low'],['M', 'Medium'],['Q', 'Quality'],['H', 'Hi Quality']]
  - name: bgColor
    display: Background Color
    type: text
  - name: fgColor
    display: Color
    type: text
sourceType: javascript
children: []
settings:
  - name: Packages
    value: '"react-qr-code": "^2.0.11",'
*/
{% set bpr %}
import QRCode from "react-qr-code";
{% endset %}
{{ save_delayed('bpr', bpr ) }}
    <QRCode
    {% if element.values.size %}width={ {{element.values.size|default(256)}} }{% endif %}
    {% if element.values.size %}height={ {{element.values.size|default(256)}} }{% endif %}
    style={ { {% if element.values.size %}height: "{{element.values.size}}px",{% endif %} maxWidth: "100%", width: "100%" } }
    {% if element.values.id %}id='{{element.values.id}}'{% endif %}
    level='{{element.values.level|default('L')}}'
    {% if element.values.value %}value={ {{element.values.value}} }{% endif %}
    {% if element.values.bgColor %}bgColor='{{element.values.bgColor|default('#FFFFFF')}}'{% endif %}
    {% if element.values.fgColor %}fgColor='{{element.values.fgColor|default('#000000')}}'{% endif %}
    />

