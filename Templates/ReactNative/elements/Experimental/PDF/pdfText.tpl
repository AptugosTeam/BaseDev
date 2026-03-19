/*
path: pdfText.tpl
type: file
unique_id: oKi42bpr
icon: ico-field
sourceType: javascript
options:
  - name: wrap
    display: Wrap
    type: checkbox
    settings:
      default: 'true'
  - name: style
    display: Text Style
    type: text
  - name: render
    display: Dynamic Render function
    type: function
  - name: fixed
    display: Fixed
    type: checkbox
  - name: hyphenationCallback
    display: Hyphenation Callback
    type: function
  - name: debug
    display: Debug Mode
    type: checkbox
*/
{% set bpr %}
import { Text } from '@react-pdf/renderer'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<Text
  {% if element.values.wrap %}wrap={ {{ element.values.wrap }} }{% endif %}
  {% if element.values.style %}style={{ element.values.style | textOrVariable }}{% endif %}
  {% if element.values.render %}render={ {{ element.values.render |functionOrCall }} }{% endif %}
  {% if element.values.hyphenationCallback %}hyphenationCallback={ {{ element.values.hyphenationCallback |functionOrCall }} }{% endif %}
  {% if element.values.fixed %}fixed={ {{ element.values.fixed }} }{% endif %}
  {% if element.values.debug %}debug={ {{ element.values.debug }} }{% endif %}
>
  {{ content | raw }}
</Text>
