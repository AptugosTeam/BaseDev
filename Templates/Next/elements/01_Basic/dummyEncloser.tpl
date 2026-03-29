/*
path: dummyEncloser.tpl
completePath: elements/Basic/dummyEncloser.tpl
unique_id: SXP50OTX
icon: ico-dummy-encloser
helpText: Organizational unit with no render value. Use it when you wish to group elements inside a holder.
options:
  - name: titleAsComment
    display: Use Name as Comment
    type: checkbox
    options: ''
    helpText: Uses the element name as a comment before rendering child content.
children: []
order: 30
*/
{% if element.values.titleAsComment %}// {{ element.name }}{% endif %}
{{ content | raw }}