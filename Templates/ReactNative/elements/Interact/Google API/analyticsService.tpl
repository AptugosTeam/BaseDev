/*
path: analyticsService.tpl
type: file
unique_id: hnIaridw
icon: ico-field
internalUse: true
children: []
renderpath: back-end/app/services/analytics.js
helpText: Generate the backend service that queries Google Analytics Reporting API for the parent analytics element
settings:
  - name: ExtraRoutes
    value: analytics
  - name: Packages
    value: '"googleapis":"latest",'
options:
  - name: endpoint
    display: Service URL
    helpText: Relative backend route that receives the analytics POST request
    type: text
    options: ''
  - name: viewid
    display: View ID (/admin/view/settings)
    helpText: Google Analytics view identifier used for the reporting API request
    type: text
    options: ''
*/
{% set parentElement = element.parent | elementData %}
  module.exports = (app) => {
  app.post('{{ parentElement.values.endpoint }}', (req, response) => {
    const { google } = require('googleapis')
    const path = require('path')

    const analyticsreporting = google.analyticsreporting('v4')
    const auth = new google.auth.GoogleAuth({
      keyFile: path.join(__dirname, 'oauth2.keys.json'),
      scopes: ['https://www.googleapis.com/auth/analytics'],
    })

    google.options({ auth })

    analyticsreporting.reports.batchGet({
      requestBody: {
        reportRequests: [
          {
            viewId: '{{ parentElement.values.viewID }}',
            dateRanges: [
              {
                startDate: req.body.dateFrom || 'Today',
                endDate: req.body.dateTo || '7daysAgo',
              },
            ],

            metrics: [
              {% for metric in parentElement.values.metric|split(';') %}
              {
                expression: '{{ metric }}',
              },
              {% endfor %}
            ],
          },
        ],
      },
    }).catch(e => {
      response.status(501)
      response.send(e.errors[0].message)
    }).then(res => {
      response.send(res.data)
    })
  })
}
