/*
path: CurvedBottomBarExpo.tpl
type: file
unique_id: cBBEpnat
icon: ico-disqus
helpText: Add Curved Bottom Bar to your Application
options:
  - name: stackScreenName
    display: Stack Screen Name
    type: text
    options: ''
  - name: type
    display: Type of the center tab item
    type: dropdown
    options: >-
      return [['DOWN','Down'],['UP','Up']]
  - name: circlePosition
    display: Position of circle button
    type: dropdown
    options: >-
      return [['CENTER','Center'],['LEFT','Left'], ['RIGHT', 'Right']]
  - name: initialRouteName
    display: Initial Route Name
    type: text
    options: ''
  - name: tabBar
    display: Function that returns a React element to display as the tab bar
    type: text
    options: ''
  - name: renderCircle
    display: Function that returns a React element to display as the center tab item
    type: text
    options: ''
  - name: useRenderCircleFunction
    display: Use renderCircle function instead of children
    type: checkbox
    options: ''
  - name: additionalContent
    display: Additional content before screens
    type: code
    options: ''
    advanced: true
  - name: circleWidth
    display: Circle Width (50 to 60)
    type: text
    options: ''
  - name: style
    display: Style
    type: text
    options: ''
  - name: shadowStyle
    display: Shadow Style
    type: text
    options: ''
  - name: width
    display: Width
    type: text
    options: ''
  - name: height
    display: Height
    type: text
    options: ''
  - name: borderTopLeftRight
    display: Border Top Left Right?
    type: checkbox
    options: ''
  - name: bgColor
    display: Background color of container view
    type: text
    options: ''
  - name: screenOptions
    display: Screen Options
    type: code
    options: ''
  - name: addStackScreen
    display: Add Stack Screen?
    type: checkbox
    options: ''
settings:
  - name: Packages
    value: '"react-native-curved-bottom-bar": "3.5.1", "@react-navigation/bottom-tabs": "^7.4.7",'
children: []
*/
{% set bpr %}
import { CurvedBottomBar } from 'react-native-curved-bottom-bar'
{% endset %}
{{ save_delayed('bpr', bpr )}}
{% if element.values.addStackScreen %}
<Stack.Screen name="{{element.values.stackScreenName | default('mainApp')}}">
{() => (
{% endif %}
  <CurvedBottomBar.Navigator
  type="{{element.values.type | default('DOWN')}}"
  {% if element.values.style %}
  style={ {{element.values.style}} }
  {% endif %}
  {% if element.values.shadowStyle %}
  shadowStyle={ {{element.values.shadowStyle}} }
  {% endif %}
  {% if element.values.height %}
  height={ {{element.values.height}} }
  {% endif %}
  {% if element.values.circleWidth %}
  circleWidth={ {{element.values.circleWidth}} }
  {% endif %}
  {% if element.values.bgColor %}
  bgColor={{ element.values.bgColor | textOrVariable }} 
  {% endif %}
  initialRouteName={{element.values.initialRouteName | textOrVariable | default('/')}}
  {% if element.values.borderTopLeftRight %}
  borderTopLeftRight
  {% endif %}
  {% if element.values.screenOptions %}
  screenOptions={ {
    {{element.values.screenOptions}}
  } }
  {% endif %}
  {% if element.values.useRenderCircleFunction and element.values.renderCircle %}
  renderCircle={ {{ element.values.renderCircle }} }
  {% else %}
  renderCircle={({ selectedTab, navigate }) => (
    {% if element.children %}
     {% for child in element.children %}
      {% if child.value != 'CurvedBottomBarExpoScreen' %}
        {{ child.rendered | raw }}
      {% endif %}
     {% endfor %}
    {% else %}
    <View>
     <Text>Hello!</Text>
    </View>
    {% endif %}
  )}
  {% endif %}
  tabBar={ {{element.values.tabBar}} }
>
  {% if element.values.additionalContent %}
  {{ element.values.additionalContent | raw }}
  {% endif %}
  {% if element.children %}
    {% for child in element.children %}
     {% if child.value == 'CurvedBottomBarExpoScreen' %}
      {{ child.rendered | raw }}
     {% endif %}
    {% endfor %}
  {% endif %}
</CurvedBottomBar.Navigator>
{% if element.values.addStackScreen %}
)}
</Stack.Screen>
{% endif %}