/*
path: Form.tpl
type: file
unique_id: 7CHs788C
icon: f:Form.svg
children: []
options: 
  - name: class
    display: ClassName
    type: text
    options: ''
  - name: value
    display: Name Button
    type: text
    options: ''
  - name: onSubmit
    display: onSubmit
    type: text
    options: ''
  - name: createButton
    display: Create your own button
    type: checkbox
    options: ''
*/
{% set tag = element.values.tag|default('form') %}
<{{tag}}
  {% if element.values.class %}
    className={ {{element.values.class|raw}} }
  {% endif %}
  {% if element.values.onSubmit %}
    onSubmit={ {{element.values.onSubmit|raw}} }
  {% endif %}

>
{{ content | raw }}
  {% if element.values.createButton is not defined or element.values.createButton is not same as(true) %}
    <input type="submit" name="form" value={{ element.values.value is empty ? "'Send'" : "'" ~ element.values.value ~ "'" | raw }} />
  {% endif %}
</{{tag}}>