/*
path: pdfDocument.tpl
type: file
unique_id: oKi38bpr
icon: ico-field
sourceType: javascript
options:
  - name: title
    display: Document Title
    type: text
  - name: author
    display: Document Author
    type: text
  - name: subject
    display: Document Subject
    type: text
  - name: keywords
    display: Document Keywords
    type: text
  - name: creator
    display: Document Creator
    type: text
  - name: producer
    display: Document Producer
    type: text
  - name: pdfVersion
    display: PDF Version
    type: text
  - name: language
    display: Document's language
    type: text
  - name: onRender
    display: On Render
    type: function
childs:
  - name: Page
    element: pdfPage
*/
{% set bpr %}
import { Document } from '@react-pdf/renderer'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<Document
  {% if element.values.title %}title={{ element.values.title | textOrVariable }}{% endif %}
  {% if element.values.author %}author={{ element.values.author | textOrVariable }}{% endif %}
  {% if element.values.subject %}subject={{ element.values.subject | textOrVariable }}{% endif %}
  {% if element.values.keywords %}keywords={{ element.values.keywords | textOrVariable }}{% endif %}
  {% if element.values.creator %}creator={{ element.values.creator | textOrVariable | default("'Aptugo'") }}{% endif %}
  {% if element.values.producer %}producer={{ element.values.producer | textOrVariable | default("'Aptugo'") }}{% endif %}
  {% if element.values.pdfVersion %}pdfVersion={{ element.values.pdfVersion | textOrVariable }}{% endif %}
  {% if element.values.language %}language={{ element.values.language | textOrVariable }}{% endif %}
  {% if element.values.onRender %}onRender={ {{ element.values.onRender |functionOrCall }} }{% endif %}
>
  {{ content | raw }}
</Document>