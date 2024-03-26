/*
path: getCurrentUser.tpl
type: file
unique_id: gcugcu
icon: ico-field
sourceType: javascript
options:
  - name: checkUserRole
    display: Check user role?
    type: checkbox
    settings:
      default: false
  - name: variableName
    display: Store In
    type: dropdown
    options: >-
      return [...aptugoUtils.variables.retrievePageVariablesFromElement(arguments[0]).filter(rpvfe => rpvfe.type === 'Variable').map(({ unique_id, name }) => [unique_id, name])]
  - name: userType
    display: User role to check
    type: text
    options: ''
    required: true
    settings:
      propertyCondition: checkUserRole
      condition: true
      active: true
  - name: goTo
    display: Page to go if validation fail
    type: text
    options: ''
    settings:
      propertyCondition: checkUserRole
      condition: true
      active: true
      default: login
children: []
*/
{% set bpr %}
import AuthService from '@services/auth.service'
{% endset %}
{{ save_delayed('bpr',bpr)}}
React.useEffect(() => {
    AuthService.getCurrentUser().then(currentUser => {
        set{{ (element.values.variableName | elementData).values.variableName }}(currentUser)
        {% if element.values.checkUserRole %}if (currentUser {% for item in element.values.userType|split(';') %} && currentUser.Role !== '{{ item }}' {% endfor %}) props.history.push('/{{ element.values.goTo|default('login') }}'){% endif %}
    })
}, [])