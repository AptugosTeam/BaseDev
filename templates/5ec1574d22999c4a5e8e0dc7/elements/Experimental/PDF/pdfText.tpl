/*
path: pdfText.tpl
completePath: elements/Experimental/PDF/pdfText.tpl
type: file
unique_id: oKi42bpr
icon: f:pdfText.svg
sourceType: javascript
options:
  - name: wrap
    display: Wrap
    type: checkbox
    settings:
      default: 'true'
  - name: style
    display: Text Styles
    type: text
  - name: fixed
    display: Fixed
    type: checkbox
  - name: render
    display: Dynamic Render function
    type: function
    advanced: true
  - name: hyphenationCallback
    display: Hyphenation Callback
    type: function
    advanced: true
  - name: debug
    display: Debug Mode
    type: checkbox
    advanced: true
childs:
  - name: Text
    element: text
*/
{% set bpr %}
  import { Text } from '@react-pdf/renderer'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<Text
  {% if element.values.wrap %}
    wrap={ {{ element.values.wrap }} }
  {% endif %}
  {% if element.values.style %}
    style={ {{ element.values.style | raw }} }
  {% endif %}
  {% if element.values.render %}
    render={ {{ element.values.render |functionOrCall }} }
  {% endif %}
  {% if element.values.hyphenationCallback %}
  h yphenationCallback={ {{ element.values.hyphenationCallback |functionOrCall }} }
  {% endif %}
  {% if element.values.fixed %}
    fixed={ {{ element.values.fixed }} }
  {% endif %}
  {% if element.values.debug %}
    debug={ {{ element.values.debug }} }
  {% endif %}
>
  {{ content | raw }}
</Text>
