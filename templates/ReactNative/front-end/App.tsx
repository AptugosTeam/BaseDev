/*
path: App.tsx
completePath: front-end/App.tsx
unique_id: Ue5mTTDJ
*/
import React from 'react'
import 'react-native-gesture-handler'
import { Provider as StateProvider } from 'react-redux'
import store from './store/store'
import { NavigationContainer } from '@react-navigation/native'
import { createNativeStackNavigator } from '@react-navigation/native-stack';

{% for page in application.pages | plain('type','page')  %}
  {% if page.filename %}
    import {{ page.name | friendly }} from './Pages/{{ page.filename | removeExtension }}'
  {% endif %}
{% endfor %}

const Stack = createNativeStackNavigator()

export default function App() {
  return (
    <StateProvider store={store}>
      <NavigationContainer>
        <Stack.Navigator screenOptions={ { headerShown: false } } initialRouteName="/">
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
        </Stack.Navigator>
      </NavigationContainer>
    </StateProvider>
  )
}
