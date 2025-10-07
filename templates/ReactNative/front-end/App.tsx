/*
path: App.tsx
completePath: front-end/App.tsx
unique_id: Ue5mTTDJ
*/
{% set hasTables = application.tables|length > 0 %}
import React from 'react'
import { GestureHandlerRootView } from 'react-native-gesture-handler'
{% if hasTables %}
import { Provider as StateProvider } from 'react-redux'
import store from './store/store'
{% endif %}
import { NavigationContainer } from '@react-navigation/native'
import { createNativeStackNavigator } from '@react-navigation/native-stack'
import * as Linking from 'expo-linking'
{{ insert_setting('AppImport') | raw }}
{{ insert_setting('AppImports') | raw }}

{% for page in application.pages | plain('type','page')  %}
  {% if page.filename %}
    import {{ page.name | friendly }} from './Pages/{{ page.filename | removeExtension }}'
  {% endif %}
{% endfor %}

const Stack = createNativeStackNavigator()

{{ insert_setting('AppBPR') | raw }}

export default function App() {
  const routeNameRef = React.useRef(null)
  const navigationRef = React.useRef(null)

  const linking = {
    prefixes: [Linking.createURL('/'),'{{ insert_setting('fancyName')|default(application.settings.name) }}://']
  }

  {{ insert_setting('AppPH') | raw }}

  return (
    {% if hasTables %}<StateProvider store={store}>{% endif %}
      <GestureHandlerRootView style={ { flex: 1 }}>
        {{ insert_setting('SiteWideWrapStart') | raw }}
          <NavigationContainer
            linking={linking}
            ref={navigationRef}
            onReady={async () => {
              if (navigationRef.current) routeNameRef.current = (navigationRef.current as any).getCurrentRoute().name;
            }}
            {{ insert_setting('NavigationHandlers') }}
            onStateChange={async () => {
              if (navigationRef.current) {
                const previousRouteName = routeNameRef.current
                const currentRouteName = (navigationRef.current as any).getCurrentRoute().name
              
                if (previousRouteName !== currentRouteName) {
                  {{ insert_setting('AppPageChange') | raw }}
                }
                routeNameRef.current = currentRouteName
              }
            }}
          >
            <Stack.Navigator screenOptions={ { headerShown: false } } initialRouteName="Dashboard">
            {% set AppBody = insert_setting('AppB') %}
            {% if AppBody %}
            {{ insert_setting('AppB') | raw }}
            {% else %}
            {% for page in application.pages | plain('type','page') %}
              {% if page.filename %}
                {% set splitParts = page.path|split('/') %}
                {% set initialPath = '' %}
                {% set params = '' %}
                {% for part in splitParts %}
                  {% if part %}
                    {% if part|first == ':' %}
                      {% set params = params ~ part|slice(1) ~ ': null,' %}
                    {% else %}
                      {% set initialPath = initialPath ~ part %}
                    {% endif %}
                  {% endif %}
                {% endfor %}
                <Stack.Screen
                  name='{{ initialPath|default("Dashboard") }}'
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
    {% if hasTables %}</StateProvider>{% endif %}
  )
}
