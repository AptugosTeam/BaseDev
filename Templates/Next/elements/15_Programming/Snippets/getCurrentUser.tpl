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
    type: text
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
  - name: table
    display: Table
    type: dropdown
    options: >-
      return aptugo.store.getState().application.tables.map(({ unique_id,name }) => [unique_id, name])
children: []
settings:
  - name: Packages
    value: '"passport": "^0.7.0","passport-local": "^1.0.0","bcryptjs": "^2.4.3","connect-mongo": "^5.1.0","next-session": "^4.0.5",'
extraFiles:
  - source: 'elements/99_ExtraFiles/997_userHook.tsx'
    destination: '/src/lib/user/hooks.tsx'
  - source: 'elements/99_ExtraFiles/996_userHookIndex.tsx'
    destination: '/src/lib/user/index.tsx'
  - source: 'elements/99_ExtraFiles/995_userApi.tsx'
    destination: '/src/pages/api/user/index.tsx'
  - source: 'elements/99_ExtraFiles/994_passportIndex.tsx'
    destination: '/src/api-lib/auth/index.tsx'
  - source: 'elements/99_ExtraFiles/993_passport.tsx'
    destination: '/src/api-lib/auth/passport.tsx'
  - source: 'elements/99_ExtraFiles/992_authMiddleware.tsx'
    destination: '/src/api-lib/middlewares/auth.tsx'
  - source: 'elements/99_ExtraFiles/991_sessionMiddleware.tsx'
    destination: '/src/api-lib/middlewares/session.tsx'
  - source: 'elements/99_ExtraFiles/990_dbAdded.tsx'
    destination: '/src/api-lib/db/auth.tsx'
  - source: 'elements/99_ExtraFiles/986_authIndex.js'
    destination: '/src/api/auth/index.js'
*/
{% set table = element.values.table | tableData %}
{% set userControlModel = (table.name | friendly) ~ 'Model' %}
{{ add_setting('userControlModel', userControlModel) }}
{% set addedMiddleWare %}
export { default as auths } from './auth'
{% endset %}
{{ add_setting('addedMiddleware', addedMiddleWare) }}
{% set addedModel %}
export * from './auth'
{% endset %}
{{ add_setting('addedModel', addedModel) }}
{% set bpr %}
import { GetServerSideProps } from 'next'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% if element.values.variableName %}
  const {{ element.values.variableName }} = props.currentUser
{% endif %}
{% set apr %}

export const getServerSideProps: GetServerSideProps = async (context) => {
  const { req, res } = context

  const protocol = process.env.NODE_ENV === 'production' ? 'https' : 'http'
  const host = req.headers.host

  const response = await fetch(`${protocol}://${host}/api/user`, { headers: { cookie: req.headers.cookie || '' } })
  const data = await response.json()

  {{ insert_setting('UserAuthServer') | raw }}
  
  return {
    props: {
      currentUser: data.user
    }
  }
}

{% endset %}
{{ save_delayed('apr',apr)}}
