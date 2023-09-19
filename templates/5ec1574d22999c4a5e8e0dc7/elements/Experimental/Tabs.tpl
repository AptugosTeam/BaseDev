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
  - name: navigation
    display: Delete Arrows
    type: checkbox
    options: ''
settings:
  - name: Packages
    value: '"@mui/lab": "^5.0.0-alpha.127",'
children: []
*/
{% set bpr %}
import TabContext from '@mui/lab/TabContext'
import TabList from '@mui/lab/TabList'
import TabPanel from '@mui/lab/TabPanel'
import Tab from '@mui/material/Tab'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% set ph %}
const [value{{ element.unique_id }}, setValue{{ element.unique_id }}] = React.useState('{{ element.children[0].unique_id }}')
{% endset %}
{{ save_delayed('ph',ph)}}
<TabContext value={value{{ element.unique_id }}}>
  <TabList onChange={(newValue) => { setValue{{ element.unique_id }}(newValue) }}>
  {% for child in element.children %}
    <Tab label={{ child.name | textOrVariable }} value="{{ child.unique_id }}" />
  {% endfor %}
  </TabList>
  {% for child in element.children %}
    <TabPanel value="{{ child.unique_id }}">
      {{ child.rendered | raw }}
    </TabPanel>
  {% endfor %}
</TabContext>