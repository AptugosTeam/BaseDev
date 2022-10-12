/*
path: 999_gmailservice.js
type: file
unique_id: PNnWiHgb
icon: ico-field
*/
class AptugoGmail {
  listLabels() {
    return new Promise((solve, reject) => {
      gapi.client.gmail.users.labels
        .list({
          userId: 'me',
        })
        .then(function (response) {
          solve(response.result)
        })
    })
  }

  listThreads() {
    return new Promise((solve, reject) => {
      gapi.client.gmail.users.threads
        .list({
          userId: 'me',
        })
        .then(function (response) {
          solve(response.result)
        })
    })
  }

  getThread(id) {
    return new Promise((solve, reject) => {
      gapi.client.gmail.users.threads
        .get({
          userId: 'me',
          id: id,
          format: 'full',
        })
        .then(function (response) {
          solve(response.result)
        })
    })
  }

  listMessages(q = '', page = null) {
    return new Promise((solve, reject) => {
      gapi.client.gmail.users.messages
        .list({
          userId: 'me',
          q: q,
          pageToken: page,
        })
        .then(function (response) {
          solve(response.result)
        })
    })
  }

  getMessage(id) {
    return new Promise((solve, reject) => {
      gapi.client.gmail.users.messages
        .get({
          userId: 'me',
          id: id,
          format: 'full',
        })
        .then(function (response) {
          solve(response.result)
        })
    })
  }

  getAttachment(messageId, attachmentId) {
    return new Promise((solve, reject) => {
      gapi.client.gmail.users.messages.attachments
        .get({
          userId: 'me',
          messageId: messageId,
          id: attachmentId,
        })
        .then(function (response) {
          solve(response.result)
        })
    })
  }

  modifyMessage(id, newBody) {
    return new Promise((solve, reject) => {
      gapi.client.gmail.users.messages
        .modify(
          {
            userId: 'me',
            id: id,
          },
          newBody
        )
        .then(function (response) {
          solve(response)
        })
    })
  }

  decodeBase64(data) {
    var b64u = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_' // base64url dictionary
    var b64pad = '='
    function base64_charIndex(c) {
      if (c == '+') return 62
      if (c == '/') return 63
      return b64u.indexOf(c)
    }

    var dst = ''
    var i, a, b, c, d, z

    for (i = 0; i < data.length - 3; i += 4) {
      a = base64_charIndex(data.charAt(i + 0))
      b = base64_charIndex(data.charAt(i + 1))
      c = base64_charIndex(data.charAt(i + 2))
      d = base64_charIndex(data.charAt(i + 3))

      dst += String.fromCharCode((a << 2) | (b >>> 4))
      if (data.charAt(i + 2) != b64pad) dst += String.fromCharCode(((b << 4) & 0xf0) | ((c >>> 2) & 0x0f))
      if (data.charAt(i + 3) != b64pad) dst += String.fromCharCode(((c << 6) & 0xc0) | d)
    }

    dst = decodeURIComponent(escape(dst))
    return dst
  }

  parseIcal(input) {
    let toReturn
    const iCalArray = this.decodeBase64(input).split('\r\n')
    iCalArray.forEach((calLine) => {
      const [calKey, calValue] = calLine.split(':')
      if (calKey === 'DTSTART') toReturn = { date: new Date(calValue), string: calValue }
    })
    return toReturn
  }

  findPart(parts, messageId) {
    let found = false
    let toReturn = ''
    parts.forEach((part) => {
      if (part.mimeType && part.mimeType === 'text/html') {
        found = true
        toReturn = this.decodeBase64(part.body.data)
      } else if (part.mimeType && part.mimeType === 'text/plain') {
        if (!found) toReturn = this.decodeBase64(part.body.data)
      } else if (part.mimeType && (part.mimeType === 'multipart/alternative' || part.mimeType === 'multipart/related')) {
        toReturn = this.findPart(part.parts, messageId)
      } else if (part.mimeType && part.mimeType === 'application/ics') {
        this.getAttachment(messageId, part.body.attachmentId).then((response) => {
          console.log('response', this.parseIcal(response.data))
        })
        console.log('invite', part.body.attachmentId)
      } else {
        console.log('could not recognize part:', part)
      }
    })
    return toReturn
  }

  analyzeMessage(message) {
    let found = false
    const output = {
      type: {},
      content: '',
    }
    if (message.payload.parts) {
      output.content = this.findPart(message.payload.parts, message.id)
      if (output.content.indexOf('class="gmail_signature"') > -1) {
        output.content = output.content.substring(0, output.content.indexOf('<div dir="ltr" class="gmail_signature"'))
      }
    }
    return output
  }

  analyzeEmail(email) {
    let messageStr
    if (email.payload.parts) {
      const result = this.analyzeMessage(email)
      messageStr = result.content
    } else {
      messageStr = this.decodeBase64(email.payload.body.data)
    }

    let headers = {}
    email.payload.headers.forEach((header) => (headers[header.name] = header.value))

    let output = {
      Type: 'Sent',
      Date: headers.Date,
      id: email.id,
      Subject: headers.Subject,
      Snippet: email.snippet,
      Contacts: [],
      Content: messageStr,
      Email: email,
    }

    const regex = /([A-Za-zÀ-ÖØ-öø-ÿ\s\.\+\@]*)[<]*([-\w\.\@]*)[>]*/

    let emailsTo = headers.To?.split(',') || []
    emailsTo.forEach((emailTo) => {
      emailTo = emailTo.replaceAll('\"','')
      const sTo = [...emailTo.match(regex)]
      if (sTo[1]) {
        output.Contacts.push({ Name: sTo[1], Email: sTo[2] || sTo[1] })
      }
    })

    const aFrom = [...headers.From.match(regex)]
    if (aFrom[1]) output.Contacts.push({ Name: aFrom[1], Email: aFrom[2] || aFrom[1] })

    if (headers['Delivered-To']) output.Type = 'Received'
    return output
  }

  // Internal
  loadGoogleScript() {
    const id = 'google-js'
    const src = 'https://apis.google.com/js/platform.js'

    const firstJs = document.getElementsByTagName('script')[0]
    if (document.getElementById(id)) {
      return
    }
    const js = document.createElement('script')
    js.id = id
    js.src = src
    js.onload = this.handleClientLoad.bind(this)
    firstJs.parentNode.insertBefore(js, firstJs)
  }

  initClient() {
    const that = this
    gapi.client
      .init({
        clientId: '185605994716-utet8l1cj4inlpe30iso2j6nug3b4m4h.apps.googleusercontent.com',
        apiKey: 'stWlxJHTVWFmv4AEB4cTDzet',
        scope: 'https://mail.google.com/ https://www.googleapis.com/auth/gmail.modify https://www.googleapis.com/auth/gmail.readonly',
        discoveryDocs: ['https://www.googleapis.com/discovery/v1/apis/gmail/v1/rest'],
      })
      .then(
        function () {
          gapi.auth2.getAuthInstance().isSignedIn.listen(that.updateSigninStatus)
          that.updateSigninStatus(gapi.auth2.getAuthInstance().isSignedIn.get())
        },
        function (error) {
          console.error(error)
        }
      )
  }

  handleClientLoad() {
    gapi.load('client:auth2', this.initClient.bind(this))
  }

  updateSigninStatus(isSignedIn) {
    this.isSignedIn = isSignedIn
  }

  constructor() {
    this.isSignedIn = false
    this.self = this
    this.loadGoogleScript()
  }
}

export default new AptugoGmail()
