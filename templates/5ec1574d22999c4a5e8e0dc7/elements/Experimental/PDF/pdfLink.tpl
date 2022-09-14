/*
path: pdfLink.tpl
completePath: elements/Experimental/PDF/pdfLink.tpl
type: file
unique_id: iJu39voe
icon: f:pdfLink.svg
sourceType: javascript
options:
  - name: src
    display: Destination
    type: text
  - name: wrap
    display: Enable page wrapping
    type: checkbox
    settings:
      default: 'true'
  - name: style
    display: Link Styles
    type: text
  - name: fixed
    display: Fixed
    type: checkbox
  - name: debug
    display: Debug Mode
    type: checkbox
    advanced: true
childs:
  - name: Text
    element: text
*/
{% set bpr %}
  import { Link } from '@react-pdf/renderer'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<Link
  {% if element.values.src %}
    src={{ element.values.src | textOrVariable }}
  {% endif %}
  {% if element.values.wrap %}
    wrap={ {{ element.values.wrap }} }
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
>
  {{ content | raw }}
</Link>
