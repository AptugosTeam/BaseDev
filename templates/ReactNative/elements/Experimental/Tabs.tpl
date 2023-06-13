/*
path: Tabs.tpl
completePath: elements/Experimental/Tabs.tpl
type: file
unique_id: oKJIl4tab
icon: f:Swiper.svg
sourceType: javascript
options:
  - name: ClassName
    display: ClassName
    type: styles 
    options: ''
  - name: slidesPerView
    display: Slides Per View
    type: text
    options: ''
  - name: slidesPerGroup
    display: Slides Per Group
    type: text
    options: ''
  - name: spaceBetween
    display: Space Between
    type: text
    options: ''
  - name: loop
    display: Cancel loop
    type: checkbox
    advanced: true
    options: ''
  - name: loopFillGroupWithBlank
    display:  Cancel blanks
    type: checkbox
    advanced: true
    options: ''
  - name: passVariable
    display: Pass Variable
    type: text
    repeatPerChild: true
    options: ''
settings:
  - name: Packages
    value: '"react-native-pager-view": "6.1.2","react-native-tab-view": "^3.5.1",'
children: []
extraFiles:
  - source: 'elements/Experimental/Tabs/index.tsx'
    destination: 'front-end/src/components/TabNavigation/index.tsx'
  - source: 'elements/Experimental/Tabs/tabnavigation.module.scss'
    destination: 'front-end/src/components/TabNavigation/tabnavigation.module.scss'
  - source: 'elements/Experimental/Tabs/TabNavigation.tsx'
    destination: 'front-end/src/components/TabNavigation/TabNavigation.tsx'
*/
{% set bpr %}
import { TabView, SceneMap } from 'react-native-tab-view'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% set bpr %}
import TabNavigation from '../components/TabNavigation'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% set bpr %}
{% for child in element.children %}
const TAB{{ child.unique_id}}Route = ({% if element.values.passVariable %}{ {{ element.values.passVariable }} }{% endif %}) => (
  {{ child.rendered | raw }}
)
{% endfor %}
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% set ph %}
const [tabIndex, setTabIndex] = React.useState(0);
const [tabRoutes] = React.useState([
  {% for child in element.children %}
  { key: '{{ child.unique_id}}', title: '{{ child.name }}' },
  {% endfor %}
])
const renderScene = ({ route }) => {
  switch (route.key) {
    {% for child in element.children %}
    case '{{ child.unique_id}}':
      return <TAB{{ child.unique_id}}Route {% if element.values.passVariable %}{{ element.values.passVariable }}={ {{ element.values.passVariable }} }{% endif %}/>
    {% endfor %}
  }
}
{% endset %}
{{ save_delayed('ph',ph)}}
<TabView
  navigationState={ { index: tabIndex, routes: tabRoutes }}
  renderScene={renderScene}
  onIndexChange={setTabIndex}
  initialLayout={ { width: dimensions.width }}
  renderTabBar={props => <TabNavigation {...props} onPress={setTabIndex}/>}
/>