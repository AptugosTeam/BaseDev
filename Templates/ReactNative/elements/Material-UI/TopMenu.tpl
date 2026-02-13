/*
path: TopMenu.tpl
type: file
unique_id: WHCOcwBU
icon: browser-51.svg
helpText: Sets a Top Navigation Menu for a Webpage
sourceType: javascript
children: []
options:
  - name: className
    display: ClassName
    type: text
    options: ''
*/
{% set bpr %}
import TopMenu, { TopMenuItem } from '../components/TopMenu'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<TopMenu {% if element.values.className %}className={ {{ element.values.className }}}{% endif %}>
{{content|raw}}
</TopMenu>
