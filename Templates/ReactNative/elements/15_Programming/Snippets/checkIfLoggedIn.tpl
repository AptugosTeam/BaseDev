/*
path: checkIfLoggedIn.tpl
type: file
unique_id: cili
icon: ico-field
sourceType: javascript
options:
  - name: loginScreenNot
    display: Redirect (If NOT)
    type: dropdown
    options: return [['none','No Redirect'],['useVar','Use a Variable'], ...aptugo.pageUtils.getAllPages()]
    settings:
      default: 'none'
  - name: fieldVariableNot
    display: Variable
    type: text
    settings:
      propertyCondition: loginScreenNot
      condition: useVar
      active: true
  - name: loginScreen
    display: Redirect (If YES)
    type: dropdown
    options: return [['none','No Redirect'],['useVar','Use a Variable'], ...aptugo.pageUtils.getAllPages()]
    settings:
      default: 'none'
  - name: fieldVariable
    display: Variable
    type: text
    settings:
      propertyCondition: loginScreen
      condition: useVar
      active: true
children: []
*/
{% if element.values.loginScreenNot != 'none' %}
  {% if element.values.loginScreenNot == 'useVar' %}
    {% set destNot = element.values.fieldVariableNot %}
  {% else %}
    {% set destNot = (element.values.loginScreenNot | elementData).path %}
    {% if destNot == '/' %}
      {% set destNot = 'Dashboard' %}
    {% elseif destNot|first == '/' %}
      {% set destNot = destNot|slice(1) %}
    {% endif %}
  {% endif %}
{% endif %}

{% if element.values.loginScreen != 'none' %}
  {% if element.values.loginScreen == 'useVar' %}
    {% set dest = element.values.fieldVariable %}
  {% else %}
    {% set dest = (element.values.loginScreen | elementData).path %}
    {% if dest == '/' %}
      {% set dest = 'Dashboard' %}
    {% elseif dest|first == '/' %}
      {% set dest = dest|slice(1) %}
    {% endif %}
  {% endif %}
{% endif %}
{% set appImport %}
import AuthService from '@services/auth.service'
import store from '@store/store'
import { clearUser, setUser } from '@store/slices/userSlice'
{% endset %}
{{ add_setting('AppImport', appImport) }}

{% set appPh %}
const [initialRouteName, setInitialRouteName] = React.useState<string | null>(null)

React.useEffect(() => {
  const checkAuthStatus = async () => {
    try {
      const user = await AuthService.getCurrentUser()

        if (user && Object.keys(user).length > 0) {
          store.dispatch(setUser(user))
          {% if element.values.loginScreen != 'none' %}
          setInitialRouteName({{ dest | textOrVariable }})
          {% else %}
          setInitialRouteName('Dashboard')
          {% endif %}
        } else {
          {% if element.values.loginScreenNot != 'none' %}
          setInitialRouteName({{ destNot | textOrVariable }})
          {% else %}
          setInitialRouteName('Dashboard')
          {% endif %}
        }
    } catch (error) {
      console.error('Error checking auth status:', error)
      store.dispatch(clearUser())
    }
  }

  checkAuthStatus()
}, [])
{% endset %}
{{ add_setting('AppPH', appPh) }}

{% set appInitialRoute %}initialRouteName{% endset %}
{{ add_setting('AppInitialRoute', appInitialRoute) }}
