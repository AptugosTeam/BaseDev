/*
path: Form.tpl
type: file
unique_id: 7CHs788C
icon: ico-field
children: []
options: []
*/

<form
  method="POST"
  action="http://127.0.0.1:4567{{element.values.action}}"
>
<input type="hidden" name="token" value="5ff714646dcece84a0c222d3" />
{{ content | raw }}
<input type="submit" name="form"/>
</form>