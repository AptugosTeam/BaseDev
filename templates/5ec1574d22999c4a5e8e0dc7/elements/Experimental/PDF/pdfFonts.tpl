/*
path: pdfFont.tpl
completePath: elements/Experimental/PDF/pdfFont.tpl
type: file
unique_id: XyZFontTpl
icon: f:pdfFont.svg
sourceType: javascript
options:
  - name: family
    display: Font Family
    type: text
  - name: fonts
    display: Fonts (Array of objects)
    type: text
*/
{% set bpr %}
  import { Font } from '@react-pdf/renderer'
{% endset %}
{{ save_delayed('bpr', bpr) }}
{% set ph %}
  {% if element.values.family and element.values.fonts %}
    Font.register({
      family: '{{ element.values.family }}',
      fonts: {{ element.values.fonts | raw }}
    })
  {% endif %}
{% endset %}
{{ save_delayed('ph', ph) }}