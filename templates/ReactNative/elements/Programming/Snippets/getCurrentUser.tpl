/*
path: getCurrentUser.tpl
type: file
unique_id: gcugcu
icon: ico-field
sourceType: javascript
options:
  - name: variableName
    display: Store In
    type: dropdown
    options: >-
      return [...aptugoUtils.variables.retrievePageVariablesFromElement(arguments[0]).filter(rpvfe => rpvfe.type === 'Variable').map(({ unique_id, name }) => [unique_id, name])]
children: []
*/
{% set bpr %}
import AuthService from '../services/auth.service'
{% endset %}
{{ save_delayed('bpr',bpr)}}
React.useEffect(() => {
    AuthService.getCurrentUser().then(result => {
        set{{ (element.values.variableName | elementData).values.variableName }}(result)
    })
}, [])