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
  {% endif %}
{% endif %}

{% if element.values.loginScreen != 'none' %}
  {% if element.values.loginScreen == 'useVar' %}
    {% set dest = element.values.fieldVariable %}
  {% else %}
    {% set dest = (element.values.loginScreen | elementData).path %}
  {% endif %}
{% endif %}
{% set appImport %}import authService from '@services/auth.service'{% endset %}{{ add_setting('AppImport', appImport) }}

{% set appPH %}
 const [initialRoute, setInitialRoute] = React.useState<string | null>(null)
 
 React.useEffect(() => {
   const checkAuthStatus = async () => {
     try {
       const user = await authService.getCurrentUser()
       
       if (user) {
         {% if element.values.loginScreen != 'none' %}
         setInitialRoute({{ dest | textOrVariable }})
         {% else %}
         setInitialRoute('/')
         {% endif %}
       } else {
         {% if element.values.loginScreenNot != 'none' %}
         setInitialRoute({{ destNot | textOrVariable }})
         {% else %}
         setInitialRoute('/')
         {% endif %}
       }
     } catch (error) {
       console.error('Error checking auth status:', error)
       setInitialRoute('/')
     }
   }
   checkAuthStatus()
 }, [])
 {% endset %}
{{ add_setting('AppPH',appPH)}}
 
{% set appInitialRoute %}initialRoute || '/'{% endset %}
{{ add_setting('AppInitialRoute',appInitialRoute)}}