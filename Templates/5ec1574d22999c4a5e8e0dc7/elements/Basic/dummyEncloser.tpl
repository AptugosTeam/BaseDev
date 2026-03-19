/*
path: dummyEncloser.tpl
completePath: elements/Basic/dummyEncloser.tpl
unique_id: SXP50OTX
icon: ico-dummy-encloser
helpText: Organizational unit with no render value
order: 3
options:
  - name: titleAsComment
    display: Use Name as Comment
    type: checkbox
    options: ''
children: []
*/
{% if element.values.titleAsComment %}// {{ element.name }}{% endif %}
{{ content | raw }}