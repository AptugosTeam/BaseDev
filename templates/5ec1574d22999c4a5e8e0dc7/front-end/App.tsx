/*
path: App.tsx
completePath: front-end/App.tsx
unique_id: EebCWx4V
children: []
*/
import React from 'react'
import { Route, Switch } from 'react-router-dom'
{{ insert_setting('SiteWideBeforePageRenderAddenum') | raw }}
{% for page in application.pages | plain('type','page')  %}
  {% if page.filename %}
    const {{ page.name | friendly }} = React.lazy(() => import ('./Pages/{{ page.filename | removeExtension }}'))
  {% endif %}
{% endfor %}

const App: React.FunctionComponent = (props: any) => {
  const routes = [
    {% for page in application.pages | plain('type','page') %}
      {% if page.filename %}
        {
          path: "{{ page.path }}",
          name: '{{ page.name }}',
          component: {{ page.name | friendly }}
        },
      {% endif %}
    {% endfor %}
  ]

  const switchRoutes = (
    <Switch>
      {routes.map((prop, key) => {
        return (
          <Route
            exact
            path={prop.path}
            component={prop.component}
            key={key}
          />
        );
      })}
    </Switch>
  )

  {{ insert_setting('SiteWideHeaderAddenum') | raw }}

  return (
    <React.Fragment>
      <React.Suspense fallback={ {{ insert_setting('FallBack')|default('<span>Loading</span>') }} }>
        {{ insert_setting('SiteWideWrapStart') | raw }}
        <React.Fragment>
          {switchRoutes}
          {{ insert_setting('SiteWideAddenum') | raw }}
        </React.Fragment>
        {{ insert_setting('SiteWideWrapEnd') | raw }}
      </React.Suspense>
    </React.Fragment>
  )
}

export default App

