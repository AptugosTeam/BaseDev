/*
path: App.tsx
completePath: front-end/App.tsx
unique_id: Ue5mTTDJ
*/
import React from 'react'
import { GestureHandlerRootView } from 'react-native-gesture-handler'
import { Provider as StateProvider } from 'react-redux'
import store from './store/store'
import { NavigationContainer } from '@react-navigation/native'
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import * as Sentry from '@sentry/react-native'

Sentry.init({
  dsn: 'https://b95c3fbb4e6394e0cdbef2da53681fd4@o4509882960052224.ingest.us.sentry.io/4510427572404224',

  // Adds more context data to events (IP address, cookies, user, etc.)
  // For more information, visit: https://docs.sentry.io/platforms/react-native/data-management/data-collected/
  sendDefaultPii: true,
  enableAutoSessionTracking: true,

  // Enable Logs
  enableLogs: true,

  // Configure Session Replay
  replaysSessionSampleRate: 0.1,
  replaysOnErrorSampleRate: 1,
  integrations: [Sentry.mobileReplayIntegration(), Sentry.feedbackIntegration()],

  // uncomment the line below to enable Spotlight (https://spotlightjs.com)
  // spotlight: __DEV__,
})

{{ insert_setting('AppImport') | raw }}
{{ insert_setting('AppImports') | raw }}

{% for page in application.pages | plain('type','page')  %}
  {% if page.filename %}
    import {{ page.name | friendly }} from './Pages/{{ page.filename | removeExtension }}'
  {% endif %}
{% endfor %}

const Stack = createNativeStackNavigator()

{{ insert_setting('AppBPR') | raw }}

export default Sentry.wrap(function App() {
  const routeNameRef = React.useRef()
  const navigationRef = React.useRef()

{{ insert_setting('AppPH') | raw }}

  const sanitizeScreenName = (name) => {
  if (!name) return 'unknown'

  // 1) remover slash inicial
  let sanitized = name.startsWith('/') ? name.substring(1) : name

  // 2) reemplazar cualquier cosa rara por underscore
  sanitized = sanitized.replace(/[^A-Za-z0-9_]/g, '_')

  return sanitized
}
{% for delay in delayed %}
  {% for specificDelay in delay.AppPH %}
    {{ specificDelay }}
  {% endfor %}
{% endfor %}

  return (
    <StateProvider store={store}>
      <GestureHandlerRootView style={ { flex: 1 }}>
        {{ insert_setting('SiteWideWrapStart') | raw }}
          <NavigationContainer
            ref={navigationRef}
            onReady={async () => {
              log()
              if (navigationRef.current) routeNameRef.current = (navigationRef.current as any).getCurrentRoute().name;
            }}
            onStateChange={async () => {
              if (navigationRef.current) {
                const previousRouteName = routeNameRef.current
                const currentRouteName = (navigationRef.current as any).getCurrentRoute().name
              
                if (previousRouteName !== currentRouteName) {
                  {{ insert_setting('AppPageChange') | raw }}
                    const sanitized = sanitizeScreenName(currentRouteName)
                  await analytics().logScreenView({
                    screen_name: sanitized,
                    screen_class: sanitized,
                  })
                }
                routeNameRef.current = currentRouteName
              }
            }}
          >
            <Stack.Navigator screenOptions={ { headerShown: false } } initialRouteName={ {{ insert_setting('AppInitialRoute') | default('"/"') | raw }} }>
            {% set AppBody = insert_setting('AppB') %}
            {% if AppBody %}
            {{ insert_setting('AppB') | raw }}
            {% else %}
            {% for page in application.pages | plain('type','page') %}
              {% if page.filename %}
                {% set splitParts = page.path|split('/') %}
                {% set initialPath = '' %}
                {% set params = '' %}
                {% for part in splitParts %}
                  {% if part %}
                    {% if part|first == ':' %}
                      {% set params = params ~ part|slice(1) ~ ': null,' %}
                    {% else %}
                      {% set initialPath = initialPath ~ '/' ~ part %}
                    {% endif %}
                  {% endif %}
                {% endfor %}
                <Stack.Screen
                  name='{{ initialPath|default("/") }}'
                  component={ {{ page.name | friendly }} }
                  {% if params %}
                  initialParams={ { {{params}} } }
                  {% endif %}
                />
              {% endif %}
            {% endfor %}
            {% endif %}
            </Stack.Navigator>
          </NavigationContainer>
        {{ insert_setting('SiteWideWrapEnd') | raw }}
      </GestureHandlerRootView>
    </StateProvider>
  )
})
