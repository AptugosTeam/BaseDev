/*
path: 998_googlecalendarService.tsx
keyPath: elements/Interact/Google API/998_googlecalendarService.tsx
unique_id: C7EJVleA
*/
import path from 'path'
import { google } from 'googleapis'

const createAuth = async (scopes, keyFilePath, subjectEmail) => {
  const auth = new google.auth.GoogleAuth({
    keyFile: keyFilePath,
    scopes: scopes,
  })

  const authClient = await auth.getClient();

  (authClient as any).subject = subjectEmail

  return auth
}

async function createGoogleMeetEvent(serviceAccountFileName, senderEmail, startTime, endTime, summary, description, attendeesEmails: string[]) {
  const calendarId = senderEmail

  const auth = await createAuth(['https://www.googleapis.com/auth/calendar'], path.join(process.cwd(), serviceAccountFileName), senderEmail)
  const calendar = google.calendar({ version: 'v3', auth })

  const event = {
    summary: summary || 'Meeting',
    description: description || 'Automatically created meeting',
    start: { dateTime: startTime.toISOString(), "timeZone": "UTC" },
    end: { dateTime: endTime.toISOString(), "timeZone": "UTC" },
    attendees: attendeesEmails.map(ae => { return { email: ae }}),
    conferenceData: {
      createRequest: {
        requestId: `meet-${Date.now()}`
      },
    },
  }

  const response:any = await calendar.events.insert({
    calendarId,
    requestBody: event,
    conferenceDataVersion: 1,
  })

  return response.data.hangoutLink
}

export { createGoogleMeetEvent }