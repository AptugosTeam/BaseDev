/*
path: themeToggle.tpl
type: file
unique_id: wtGqPUww
icon: ico-theme-toggle
options:
  - name: animatedIcon
    display: Use Animated Icon
    type: checkbox
*/
<div className={theme.toggleTheme} onClick={() => { document.getElementsByTagName('html')[0].classList.toggle('theme-dark') }}>
{% if element.values.animatedIcon %}
  {% set innerParams = { 'element': { 'unique_id': item.unique_id, values: { "className": "theme.dark", "icon": "line-md:moon-filled-alt-to-sunny-filled-loop-transition" } } } %}
  {% include includeTemplate('Icon.tpl') with innerParams %}
  {% set innerParams = { 'element': { 'unique_id': item.unique_id, values: { "className": "theme.light", "icon": "line-md:sunny-filled-loop-to-moon-filled-transition" } } } %}
  {% include includeTemplate('Icon.tpl') with innerParams %}
{% else %}
  🌗
{% endif %}
</div>