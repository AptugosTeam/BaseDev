/*
path: Form.tpl
type: file
unique_id: 7CHs788C
icon: file.svg
children: []
options: []
*/
<form
  method="{{element.values.method}}"
  action="http://localhost:4567{{element.values.action}}"
>
<input type="hidden" name="token" value="5ff714646dcece84a0c222d3" />
{{ content | raw }}
<input type="submit" name="form"/>
</form>