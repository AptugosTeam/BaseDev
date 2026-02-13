/*
path: Container.tpl
type: file
unique_id: 3NDAATVX
icon: f:Container.svg
helpText: >-
  The container centers your content horizontally. It's the most basic layout
  element.
options:
  - name: className
    display: className
    type: styles
    options: ''
  - name: maxWidth
    display: Max Width
    type: dropdown
    options: lg;md;sm;xl;xs;false
  - name: disableGutters
    display: Disable Gutters
    type: checkbox
    options: ''
    advanced: true
  - name: fixed
    display: Fixed?
    type: checkbox
    options: ''
    advanced: true
  - name: sx
    display: Styles
    type: text
    options: ''
    advanced: true
sourceType: javascript
children: []
*/
<div className={theme.container}
  {% if element.values.className %}
    className={ {{ element.values.className }} }
  {% endif %}
  {% if (element.values.maxWidth) %}
    {% if (element.values.maxWidth == 'false') %}
      maxWidth={false}
    {% else %}
      maxWidth="{{ element.values.maxWidth }}"
    {% endif %}
  {% endif %}
  {% if element.values.disableGutters %}
    disableGutters
  {% endif %}
  {% if element.values.fixed %}
    fixed
  {% endif %}
  {% if element.values.sx %}
    sx={ { {{ element.values.sx }} } }
  {% endif %}
>
  {{ content | raw }}
</div>
