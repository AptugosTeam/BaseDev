/*
path: dummyEncloser.tpl
completePath: elements/Basic/dummyEncloser.tpl
unique_id: SXP50OTX
icon: ico-dummy-enclosure
helpText: Organizational unit with no render value
options:
  - name: name
    display: namee
    type: text
    options: ''
  - name: titleAsComment
    display: Use Name as Comment
    type: checkbox
    options: ''
children: []
*/
{% if element.values.useTitleAsComment %}// {{ element.name }}{% endif %}
{{ content | raw }}

