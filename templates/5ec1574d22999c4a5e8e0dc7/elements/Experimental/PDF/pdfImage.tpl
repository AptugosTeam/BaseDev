/*
path: pdfImage.tpl
type: file
unique_id: oKi41bpr
icon: ico-field
sourceType: javascript
options:
  - name: src
    display: Source
    type: text
    settings:
      default: 'true'
  - name: style
    display: Page Style
    type: text
  - name: cache
    display: Cache
    type: checkbox
    settings:
      default: true
  - name: fixed
    display: Fixed
    type: checkbox
  - name: debug
    display: Debug Mode
    type: checkbox
*/
{% set bpr %}
import { Image } from '@react-pdf/renderer'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<Image
  {% if element.values.src %}src={{ element.values.src | textOrVariable }}{% endif %}
  {% if element.values.style %}style={{ element.values.style | textOrVariable }}{% endif %}
  {% if element.values.debug %}debug={ {{ element.values.debug }} }{% endif %}
  {% if element.values.fixed %}fixed={ {{ element.values.fixed }} }{% endif %}
  {% if element.values.cache %}cache={ {{ element.values.cache }} }{% endif %}
>
  {{ content | raw }}
</Image>
