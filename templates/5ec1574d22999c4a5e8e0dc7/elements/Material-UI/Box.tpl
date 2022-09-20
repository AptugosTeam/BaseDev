/*
path: Box.tpl
type: file
unique_id: KcwTMbe3
icon: ico-box
helpText: >-
  The Box component serves as a wrapper component for most of the CSS utility
  needs.
sourceType: javascript
options:
  - name: color
    display: Color
    type: dropdown
    options: 'common.black;common.white;primary.main;primary.light;primary.dark;primary.contrastText;secondary.main;secondary.light;secondary.dark;secondary.contrastText;error.main;error.light;error.dark;error.contrastText;warning.main;warning.light;warning.dark;warning.contrastText;info.main;info.light;info.dark;info.contrastText;succcess.main;succcess.light;succcess.dark;succcess.contrastText'
  - name: xsdisplay
    display: Extra Small
    type: dropdown
    options: 'unset;block;none;flex'
  - name: mddisplay
    display: Mid Size
    type: dropdown
    options: 'unset;block;none;flex'
  - name: justifyContent
    display: Justify Content
    type: dropdown
    options: 'unset;flex-start;flex-end;center;space-between;space-around;space-evenly'
children: []
*/
{% set bpr %}
import Box from '@mui/material/Box'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Box
  {% if element.values.color %}
    color="{{ element.values.color }}"
  {% endif %}
  sx={ {
    display: {
      {% if element.values.xsdisplay and element.values.xsdisplay != 'unset' %}
       xs: '{{ element.values.xsdisplay }}',
      {% endif %}
      {% if element.values.mddisplay and element.values.mddisplay != 'unset' %}
        md: '{{ element.values.mddisplay }}',
      {% endif %}
    },
    {% if element.values.justifyContent and element.values.justifyContent != 'unset' %}
      justifyContent: '{{ element.values.justifyContent }}'
    {% endif %}
  } }
>
  {{ content | raw }}
</Box>