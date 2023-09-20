/*
path: 998_googlecalendarService.js
completePath: >-
  /Users/gastongorosterrazu/Aptugo/BaseDev/templates/5ec1574d22999c4a5e8e0dc7/elements/Interact/Google
  API/998_googlecalendarService.js
keyPath: elements/Interact/Google API/998_googlecalendarService.js
unique_id: C7EJVleA
*/
const path = require('path')
const process = require('process')
const { authenticate } = require('@google-cloud/local-auth')
const { google } = require('googleapis')
const fs = require('fs')

class AptugoGoogleAuth {
  constructor() {
    this.scopes = ['https://www.googleapis.com/auth/calendar']
    this.tokenPath = path.join(process.cwd(), 'token.json')
    this.credentialsPath = path.join(process.cwd(), 'credentials.json')
    return this
  }

  /**
   * Authorizes the user to interact with the API
   *
   * @return {Promise<any>}
   */
  async doAuthorize () {
    this.auth = await this.authorize()
    return this.auth
  }

  /**
   * Reads previously authorized credentials from the save file.
   *
   * @return {Promise<OAuth2Client|null>}
   */
  async loadSavedCredentialsIfExist () {
    try {
      const content = await fs.promises.readFile(this.tokenPath)
      const credentials = JSON.parse(content)
      return google.auth.fromJSON(credentials)
    } catch (err) {
      return null
    }
  }

  /**
   * Serializes credentials to a file compatible with GoogleAUth.fromJSON.
   *
   * @param {OAuth2Client} client
   * @return {Promise<void>}
   */
  async saveCredentials (client) {
    const content = await fs.promises.readFile(this.credentialsPath)
    const keys = JSON.parse(content)
    const key = keys.installed || keys.web
    const payload = JSON.stringify({
      type: 'authorized_user',
      client_id: key.client_id,
      client_secret: key.client_secret,
      refresh_token: client.credentials.refresh_token,
    })
    await fs.promises.writeFile(this.tokenPath, payload)
  }

  /**
   * Load or request or authorization to call APIs.
   *
   */
  async authorize () {
    let client = await this.loadSavedCredentialsIfExist()
    if (client) {
      return client
    }
    client = await authenticate({
      scopes: this.scopes,
      keyfilePath: this.credentialsPath,
    })
    if (client.credentials) {
      await this.saveCredentials(client)
    }
    this.auth = client
    return client
  }

  /**
   * Returns a list of events in the user calendar
   * @param {*} options
   * @returns [events]
   */
  async listEvents (options = { calendarId: 'primary', timeMin: new Date().toISOString(), maxResults: 50, singleEvents: true, orderBy: 'startTime' }) {
    const auth = this.auth
    return new Promise(async (resolve, reject) => {
      const calendar = google.calendar({ version: 'v3', auth })
      const res = await calendar.events.list(options)
      const events = res.data.items
      if (!events || events.length === 0) {
        resolve([])
        return
      }

      resolve(events)
    })
  }

  /**
   * Creates a new event in the user's Google Calendar.
   *
   * @param {Object} options - Options for creating the event.
   * @param {Boolean} [meet=false] - Indicates whether a Google Meet conference should be created for the event.
   * @returns {Promise<Object>} - A Promise that resolves with the created event object if successful, or rejects with an error.
   */
  async createEvent (options, meet = false) {
    const auth = this.auth
    return new Promise(async (resolve, reject) => {
      const calendar = google.calendar({ version: 'v3', auth })

      // Define the event object with provided options
      const event = {
        summary: options.summary,
        description: options.description,
        start: {
          dateTime: options.dateTimeStart,
          timeZone: options.timeZone,
        },
        end: {
          dateTime: options.dateTimeEnd,
          timeZone: options.timeZone,
        },
        recurrence: options.recurrence,
        attendees: options.attendees,
        reminders: {
          useDefault: false,
          overrides: options.reminders,
        },
      }

      // Define calendar options for event creation
      const calendarOptions = {
        auth: auth,
        calendarId: 'primary',
        resource: event,
      }

      // If 'meet' is true, include Google Meet conference data
      if (meet) {
        event.conferenceData = {
          createRequest: { requestId: "7qxalsvy0e" }
        }
        calendarOptions.resource = event;
        calendarOptions.sendNotifications = true
        calendarOptions.conferenceDataVersion = 1
      }

      // Insert the event into the user's calendar
      calendar.events.insert(
        calendarOptions,
        function (err, event) {
          if (err) {
            reject(err)
            return
          }
          resolve(event)
        }
      )
    })
  }

  /**
   * Adds a Google Meet conference to an existing event in the user's Google Calendar.
   *
   * @param {Object} theEvent - The event to which the Google Meet conference will be added.
   * @returns {Promise<Object>} - A Promise that resolves with the updated event object if successful, or rejects with an error.
   */
  async addMeet (theEvent) {
    const auth = this.auth
    return new Promise((resolve, reject) => {
      const calendar = google.calendar({ version: 'v3', auth })
      const eventPatch = {
        conferenceData: {
          createRequest: { requestId: '7qxalsvy0e' },
        },
      }

      calendar.events.patch(
        {
          calendarId: 'primary',
          eventId: theEvent.data.id,
          resource: eventPatch,
          sendNotifications: true,
          conferenceDataVersion: 1,
        },
        function (err, event) {
          if (err) {
            reject(err)
          } else {
            resolve(event)
          }
        }
      )
    })
  }
}

module.exports = new AptugoGoogleAuth()