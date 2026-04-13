/*
path: analytics.tpl
type: file
unique_id: bn5ppsxe
icon: ico-google-analytics
children: []
helpText: Request Google Analytics reporting data from a backend endpoint and store the response in a local state variable
options:
  - name: viewID
    display: View ID (/admin/view/settings)
    helpText: Google Analytics view identifier used by the reporting service
    type: text
    options: ''
  - name: metric
    display: Metrics
    helpText: One or more Analytics metric expressions to request in the report
    type: chips
    options: >-
      ga:users,Users;ga:newUsers,New Users;ga:1dayUsers,1 Day Active
      Users;ga:7dayUsers,7 Day Active Users;ga:14dayUsers,14 Day Active
      Users;ga:28dayUsers,28 Day Active Users;ga:30dayUsers,30 Day Active Users
  - name: endpoint
    display: Endpoint URL
    helpText: Backend route that proxies the Google Analytics reporting request
    type: text
    options: ''
  - name: stateName
    display: State Variable Name
    helpText: Name of the state variable that will hold the report response
    type: text
    options: ''
  - name: dateFrom
    display: Date From
    helpText: Start date sent to the backend report request
    type: text
    options: ''
  - name: dateTo
    display: Date To
    helpText: End date sent to the backend report request
    type: text
    options: ''
childs:
  - name: analyticsService.tpl
    element: analyticsService
    display: e
  - name: JSON Keys file
    element: oauthkeysjson
settings:
  - name: Packages
    value: '"@react-native-firebase/app": "^19.2.2",'
*/

{% set bpr %}
import axios from 'axios'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set bpr %}
import { resolveApiUrl } from '@services/api'
{% endset %}
{{ save_delayed('bpr',bpr) }}

const [{{ element.values.stateName }}, set{{ element.values.stateName }}] = React.useState(null)

React.useEffect(() => {
  axios.post(resolveApiUrl('{{ element.values.endpoint }}'),
  {
    dateFrom: '{{ element.values.dateFrom }}',
    dateTo: '{{ element.values.dateTo }}'
  }).then(res => {
    set{{ element.values.stateName }}(res.data.reports)
  }).catch(e => {
    console.error(e.response.data)
  })
},[])
