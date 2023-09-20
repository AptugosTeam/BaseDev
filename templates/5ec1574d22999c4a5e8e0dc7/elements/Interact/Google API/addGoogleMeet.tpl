/*
path: addGoogleMeet.tpl
unique_id: EqupqW7m
options:
  - name: meetingID
    display: Meeting ID
    type: text
settings:
  - name: ServerRoute
    value: |
      app.post('/{{ element.values.endpointURL|default('addGoogleMeet') }}', (req, res, next) => {
        googleCalendarService.doAuthorize().then(() => {
          googleCalendarService.addMeet(req.body.id).then((response) => {
            res.send(response)
          }).catch(err => {
            res.status(500).send(err)
          })
        })
      })
*/
{% set bpr %}
import axios from 'axios'
{% endset %}
{{ save_delayed('bpr',bpr) }}
const data = {
  id: {{ element.values.meetingID | raw }},
}
axios.post(`{{ settings.apiURL }}/{{ element.values.endpointURL|default('addGoogleMeet') }}`, data).then(result => {
  {{ content | raw }}
})