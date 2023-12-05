/*
path: JoditTextEditor.tpl
type: file
unique_id: judithTextoEditor
icon: f:Skeleton.svg
helpText: Display a placeholder preview of your content before the data gets loaded to reduce load-time frustration.
children: []
options:
  - name: value
    display: Value
    type: text
    options: ''
  - name: onBlur
    display: On Blur
    type: function
    options: ''
*/

{% set bpr %}
import JoditEditor from 'jodit-react';
{% endset %}
{{ save_delayed('bpr',bpr) }}

<JoditEditor
  {% if element.values.value %}value={ {{ element.values.value }} }{% endif %}
  {% if element.values.onBlur %}onBlur={ (newContent) => { {{element.values.onBlur}} } }{% endif %}
		// config={config}
/>