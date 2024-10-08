/*
path: ph.tpl
completePath: elements/Aptugo Internal Use/ph.tpl
unique_id: D10wnZ8z
prevent_delete: true
icon: ico-field
*/
{% if element.values.localStyles %}
{% set bpr %}
import { mergeClasses } from '@services/utils'
{% endset %}
{{ save_delayed('bpr',bpr) }}
  const localStyles = { {{ element.values.localStyles | raw }} }
{% endif %}
const {{ page.name | friendly }}: FunctionComponent = (props: any) => {
  const router = useRouter()
  const {
    history: navigation,
    match: { params = {} } = {},
  } = props;
  {% for delay in delayed %}
    {{ delay }}
  {% endfor %}

  {{ content|raw }}
  return (<React.Fragment>