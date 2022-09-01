/*
path: createMeeting.tpl
completePath: elements/Interact/Zoom API/createMeeting.tpl
type: file
unique_id: zoomnewmeeting
icon: f:createMeeting.svg
children: []
options:
  - name: endpoint
    display: Server Endpoint
    type: text
    settings:
      default: "'/api/createZoomMeeting'"
  - name: apiKey
    display: Zoom's API KEY
    type: text
  - name: apiSecret
    display: Zoom's API Secret
    type: text
settings:
  - name: ServerRoute
    value: |
      app.post('{{ element.values.endpoint | default('/api/createZoomMeeting') }}', (req,res) => {
        const axios = require('axios')
        const jwt = require('jsonwebtoken')
        const payload = {
          iss: '{{ element.values.apiKey }}',
          exp: ((new Date()).getTime() + 5000)
        };
        const token = jwt.sign(payload, '{{ element.values.apiSecret }}')

        const mainData = {
          agenda: 'Course Meeting',
          settings: {
            breakout_room: {
              enable: true,
              rooms: [
                {
                  name: 'room1',
                  participants: [],
                },
                {
                  name: 'room2',
                  participants: [],
                },
              ],
            },
            mute_upon_entry: true,
            participant_video: true,
            waiting_room: true,
            watermark: true,
          },
          type: 2,
        }

        Object.assign(mainData, req.body.data)

        var options = {
          url: "https://api.zoom.us/v2/users/me/meetings", 
          method: "POST",
          headers: { 
            'Content-Type': 'application/json', 
            'Accept': 'application/json', 
            'Authorization': 'Bearer ' + token
          },
          data: mainData
        }

        axios(options)
          .then(function (response) {
            res.send(response.data)
          })
          .catch(function (error) {
            res.send(error)
          });
      })
*/
{% set bpr %}
import axios from 'axios'
{% endset %}
{{ save_delayed('bpr',bpr) }}
axios.post('{{ settings.apiURL }}{{ element.values.endpoint | default('/api/createZoomMeeting') }}', data).then(result => {
 {{ content | raw }}
})