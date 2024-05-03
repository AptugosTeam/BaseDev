/*
path: analytics.tpl
type: file
unique_id: bn5ppsxe
icon: ico-google-analytics
children: []
options:
  - name: viewID
    display: View ID (/admin/view/settings)
    type: text
    options: ''
  - name: metric
    display: Metrics
    type: chips
    options: >-
      ga:users,Users;ga:newUsers,New Users;ga:1dayUsers,1 Day Active
      Users;ga:7dayUsers,7 Day Active Users;ga:14dayUsers,14 Day Active
      Users;ga:28dayUsers,28 Day Active Users;ga:30dayUsers,30 Day Active Users
  - name: endpoint
    display: Endpoint URL
    type: text
    options: ''
  - name: stateName
    display: State Variable Name
    type: text
    options: ''
  - name: dateFrom
    display: Date From
    type: text
    options: ''
  - name: dateTo
    display: Date To
    type: text
    options: ''
childs:
  - name: analyticsService.tpl
    element: analyticsService
    display: e
  - name: JSON Keys file
    element: oauthkeysjson
*/

{% set bpr %}
import axios from 'axios'
{% endset %}
{{ save_delayed('bpr',bpr) }}

const [{{ element.values.stateName }}, set{{ element.values.stateName }}] = React.useState(null)

React.useEffect(() => {
  axios.post(`${process.env.APIURL}{{ element.values.endpoint }}`,
  {
    dateFrom: '{{ element.values.dateFrom }}',
    dateTo: '{{ element.values.dateTo }}'
  }).then(res => {
    set{{ element.values.stateName }}(res.data.reports)
  }).catch(e => {
    console.error(e.response.data)
  })
},[])
