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