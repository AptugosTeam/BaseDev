/*
path: ph.tpl
completePath: elements/Aptugo Internal Use/ph.tpl
unique_id: D10wnZ8z
prevent_delete: true
icon: ico-field
*/
const {{ page.name | friendly }}: FunctionComponent = (props: any) => {
  {{ content|raw }}
  return (<>