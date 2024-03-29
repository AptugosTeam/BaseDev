/*
path: pdfImage.tpl
completePath: elements/Experimental/PDF/pdfImage.tpl
type: file
unique_id: oKi41bpr
icon: f:pdfImage.svg
sourceType: javascript
options:
  - name: src
    display: Source
    type: text
    settings:
      default: 'true'
  - name: style
    display: Page Styles
    type: text
  - name: fixed
    display: Fixed
    type: checkbox
  - name: cache
    display: Cache
    type: checkbox
    settings:
      default: true
    advanced: true
  - name: debug
    display: Debug Mode
    type: checkbox
    advanced: true
*/
{% set bpr %}
import { Image } from '@react-pdf/renderer'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<Image
  {% if element.values.src %}
    src={{ element.values.src | textOrVariable }}
  {% endif %}
  {% if element.values.style %}
    style={ {{ element.values.style | raw }} }
  {% endif %}
  {% if element.values.debug %}
    debug={ {{ element.values.debug }} }
  {% endif %}
  {% if element.values.fixed %}
    fixed={ {{ element.values.fixed }} }
  {% endif %}
  {% if element.values.cache %}
    cache={ {{ element.values.cache }} }
  {% endif %}
>
  {{ content | raw }}
</Image>
