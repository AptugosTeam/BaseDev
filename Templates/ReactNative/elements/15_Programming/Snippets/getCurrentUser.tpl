/*
path: getCurrentUser.tpl
type: file
unique_id: gcugcu
icon: ico-field
sourceType: javascript
options:
  - name: variableName
    display: Store In
    type: text
  - name: code
    display: On Load
    type: code
children: []
*/
{% set bpr %}
import { useSelector } from 'react-redux'
import { RootState } from '@store/store'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% set ph %}
{% set storeName = element.values.variableName | default('currentUserData') %}
const {{ storeName }} = useSelector((state: RootState) => state.user.userData)

{% if element.values.code or content %}
React.useEffect(() => {
  {{ element.values.code }}
  {{ content | raw }}
}, [{{ storeName }}])
{% endif %}
{% endset %}
{{ save_delayed('ph', ph) }}