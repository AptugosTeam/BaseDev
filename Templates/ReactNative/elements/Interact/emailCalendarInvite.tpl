/*
path: emailCalendarInvite.tpl
type: file
unique_id: AabTsZ3M
icon: ico-email
completePath: elements/Interact/emailCalendarInvite.tpl
options:
  - name: startDate
    display: Start Date
    type: text
    options: ''
  - name: endDate
    display: End Date
    type: text
    options: ''
  - name: summary
    display: Summary
    type: text
    options: ''
  - name: description
    display: Description
    type: text
  - name: location
    display: Location
    type: text
  - name: url
    display: URL
    type: text
  - name: organizer
    display: Organizer Name
    type: text
  - name: organizerEmail
    display: Organizer Email
    type: text
settings:
  - name: BackendPackages
    value: '"ical-generator": "^3.0.1",'
  - name: ServerRoute
    value: |
      const ical = require('ical-generator')

      function addICal(mail) {
        function getIcalObjectInstance() {
          const cal = ical({ domain: "{{ element.values.url }}", name: '{{ element.values.summary }}' })
          cal.createEvent({
            start: new Date('{{ element.values.startDate }}'),
            end: new Date('{{ element.values.endDate }}'),
            summary: '{{ element.values.summary }}',
            description: '{{ element.values.description }}',
            location: '{{ element.values.location }}',
            url: '{{ element.values.url }}',
            organizer: {
                name: '{{ element.values.organizer }}',
                email: '{{ element.values.organizerEmail }}'
            },
          })
          return cal
        }
        const calendarObj = getIcalObjectInstance()

        let alternatives = {
          "Content-Type": "text/calendar",
          "method": "REQUEST",
          "content": Buffer.from(calendarObj.toString()),
            "component": "VEVENT",
            "Content-Class": "urn:content-classes:calendarmessage"
        }
        
        mail['alternatives'] = alternatives;
        mail['alternatives']['contentType'] = 'text/calendar'
        mail['alternatives']['content'] = Buffer.from(calendarObj.toString())
      }
*/
// Email calendar invite added