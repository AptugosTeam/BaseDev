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
children: []
*/
{% set bpr %}
import { useSelector } from 'react-redux'
import { RootState } from '@store/store'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% set ph %}
const currentUserData = useSelector((state: RootState) => state.user.userData)

{% if element.values.variableName %}
React.useEffect(() => {
  set{{ (element.values.variableName | elementData).values.variableName }}(currentUserData || {})
}, [currentUserData])
{% endif %}
{% endset %}
{{ save_delayed('ph', ph) }}