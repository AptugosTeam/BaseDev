/*
path: pdfPage.tpl
completePath: elements/Experimental/PDF/pdfPage.tpl
type: file
unique_id: oKi39bpr
icon: f:pdfPage.svg
sourceType: javascript
options:
  - name: size
    display: Page Size
    type: dropdown
    options: Custom;4A0;2A0;A0;A1;A2;A3;A4;A5;A6;A7;A8;A9;A10;B0;B1;B2;B3;B4;B5;B6;B7;B8;B9;B10;C0;C1;C2;C3;C4;C5;C6;C7;C8;C9;C10;RA0;RA1;RA2;RA3;RA4;SRA0;SRA1;SRA2;SRA3;SRA4;EXECUTIVE;FOLIO;LEGAL;LETTER;TABLOID;ID1
    settings:
      default: 'A4'
  - name: customWidth
    display: Custom Width
    type: text
    settings:
      condition: Custom
      propertyCondition: size
  - name: customHeight
    display: Custom Height
    type: text
    settings:
      condition: Custom
      propertyCondition: size
  - name: orientation
    display: Page's orientation
    type: dropdown
    options: return [ [ 'portrait', 'Portrait' ], [ 'landscape', 'Landscape' ] ]
    settings:
      default: 'portrait'
  - name: style
    display: Page Styles
    type: text
  - name: wrap
    display: Enable page wrapping
    type: checkbox
    settings:
      default: 'true'
  - name: debug
    display: Debug Mode
    type: checkbox
    advanced: true
*/
{% set bpr %}
  import { Page } from '@react-pdf/renderer'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<Page
  {% if element.values.size %}
    {% if element.values.size == 'Custom' %}
      size={[ {{element.values.customWidth | textOrVariable | default(1240)}}, {{element.values.customHeight | textOrVariable | default(1550)}} ]}
    {% endif %}
    {% if element.values.size != 'Custom' %}
      size={{ element.values.size | textOrVariable | default('LEGAL') }}
    {% endif %}
  {% endif %}
  {% if element.values.orientation %}
    orientation={{ element.values.orientation | textOrVariable | default('portrait') }}
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
>
  {{ content | raw }}
</Page>
