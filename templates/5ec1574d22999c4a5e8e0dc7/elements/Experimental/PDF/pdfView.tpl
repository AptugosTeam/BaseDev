/*
path: pdfView.tpl
completePath: elements/Experimental/PDF/pdfView.tpl
type: file
unique_id: oKi40bpr
icon: f:pdfView.svg
sourceType: javascript
options:
  - name: style
    display: Styles
    type: text
  - name: wrap
    display: Enable page wrapping
    type: checkbox
    settings:
      default: 'true'
  - name: fixed
    display: Fixed
    type: checkbox
  - name: render
    display: Dynamic Render function
    type: function
    advanced: true
  - name: debug
    display: Debug Mode
    type: checkbox
    advanced: true
*/
{% set bpr %}
import { View } from '@react-pdf/renderer'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<View
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
  {% if element.values.render %}
    render={ {{ element.values.render |functionOrCall }} }
  {% endif %}
>
  {{ content | raw }}
</View>
