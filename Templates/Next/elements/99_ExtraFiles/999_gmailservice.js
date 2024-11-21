/*
path: 999_gmailservice.js
type: file
unique_id: PNnWiHgb
icon: ico-field
*/
import axios from 'axios'

class AptugoGmail {
  constructor() {
    this.accessToken = null
  }

  getUserInfo(credentials) {
    const userInfo = this.decodeJwt(credentials)
    return userInfo.payload
  }

  decodeJwt(token) {
    var segments = token.split('.')
    if (segments.length !== 3) throw new Error('Not enough or too many segments')

    var headerSeg = segments[0]
    var payloadSeg = segments[1]
    var signatureSeg = segments[2]

    var header = JSON.parse(this.base64urlDecode(headerSeg))
    var payload = JSON.parse(this.base64urlDecode(payloadSeg))

    return {
      header: header,
      payload: payload,
      signature: signatureSeg,
    }
  }

  base64urlDecode(str) {
    return Buffer.from(this.base64urlUnescape(str), 'base64').toString()
  }

  base64urlUnescape(str) {
    str += Array(5 - (str.length % 4)).join('=')
    return str.replace(/\-/g, '+').replace(/_/g, '/')
  }

  getMyMessages() {
    return axios
      .get('https://gmail.googleapis.com/gmail/v1/users/me/messages', {
        headers: { Authorization: `Bearer ${this.accessToken}` },
        params: {
          maxResults: 200,
          pageToken: this.nextPage || localStorage.getItem('nextPage') || null,
        },
      })
      .then((response) => response.data)
      .then((response) => {
        localStorage.setItem('nextPage', response.nextPageToken)
        this.nextPage = response.nextPageToken
        return response.messages
      })
  }

  getMessage(id) {
    return axios
      .get('https://gmail.googleapis.com/gmail/v1/users/me/messages/' + id, {
        headers: { Authorization: `Bearer ${this.accessToken}` },
      })
      .then((response) => response.data)
      .then((response) => {
        return response
      })
  }

  _findPart(parts, messageId) {
    let found = false
    let toReturn = ''
    parts.forEach((part) => {
      if (part.mimeType && part.mimeType === 'text/html') {
        found = true
        toReturn = this._decodeBase64(part.body.data)
      } else if (part.mimeType && part.mimeType === 'text/plain') {
        if (!found) toReturn = this._decodeBase64(part.body.data)
      } else if (part.mimeType && (part.mimeType === 'multipart/alternative' || part.mimeType === 'multipart/related')) {
        toReturn = this._findPart(part.parts, messageId)
      } else if (part.mimeType && part.mimeType === 'application/ics') {
        // this.getAttachment(messageId, part.body.attachmentId).then((response) => {
        //   console.log('response', this.parseIcal(response.data))
        // })
        console.log('invite', part.body.attachmentId)
      } else {
        console.log('could not recognize part:', part)
      }
    })
    return toReturn
  }

  _decodeBase64(data) {
    if (!data) return 'error, no data'
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

  _analyzeMessage(message) {
    const output = {
      type: {},
      content: '',
    }
    if (message.payload.parts) {
      output.content = this._findPart(message.payload.parts, message.id)
      if (output.content.indexOf('class="gmail_signature"') > -1) {
        output.content = output.content.substring(0, output.content.indexOf('<div dir="ltr" class="gmail_signature"'))
      }
    }
    return output
  }

  _parseEmail(email) {
    const regex = /"?([^<]*)"?[<]*([-\w\.\@]*)[>]*/
    const aFrom = [...email.match(regex)]
    console.log('aFrom', email, aFrom)
    if (aFrom[1]) return { Name: aFrom[1].trim(), Email: aFrom[2] || aFrom[1] }
    else return email
  }

  _getAllPeopleInvolved(headers) {
    const participants = new Set()
    for (let j = 0; j < headers.length; j++) {
      if (['From', 'To', 'Cc', 'Bcc'].includes(headers[j].name)) {
        headers[j].value.split(',').forEach((email) => {
          participants.add(this._parseEmail(email.trim()))
        })
      }
    }
    return participants
  }

  analyzeMessage(email) {
    let messageStr
    if (email.payload.parts) {
      const result = this._analyzeMessage(email)
      messageStr = result.content
    } else {
      messageStr = this._decodeBase64(email.payload.body.data)
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
    const peopleInvolved = this._getAllPeopleInvolved(email.payload.headers)
    output.Contacts.push(...peopleInvolved)

    if (headers['Delivered-To']) output.Type = 'Received'
    return output
  }
}

export default new AptugoGmail()
