/*
path: Tabs.tpl
completePath: elements/Experimental/Tabs.tpl
type: file
unique_id: oKJIl4tab
icon: ico-field
sourceType: javascript
options:
  - name: ClassName
    display: ClassName
    type: styles 
    options: ''
  - name: useWithLoop
    display: Using a Loop 
    type: checkbox
    options: ''
    advanced: true
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
{% if element.values.useWithLoop %}
const [values{{ element.unique_id }}, setValues{{ element.unique_id }}] = React.useState([
  {% for child in element.children %}
    '{{ child.unique_id }}',
  {% endfor %}
]);
{% else %}
const [value{{ element.unique_id }}, setValue{{ element.unique_id }}] = React.useState('{{ element.children[0].unique_id }}')
{% endif %}
{% endset %}
{{ save_delayed('ph',ph)}}
{% if element.values.useWithLoop %}
<TabContext value={values{{ element.unique_id }}[index]}>
  <TabList onChange={(_e, newValue) => {
    const newValues = [...values{{ element.unique_id }}];
    newValues[index] = newValue;
    setValues{{ element.unique_id }}(newValues);
  }}>
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
{% else %}
<TabContext value={value{{ element.unique_id }}}>
  <TabList onChange={(_e, newValue) => { setValue{{ element.unique_id }}(newValue) }}>
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
{% endif %}