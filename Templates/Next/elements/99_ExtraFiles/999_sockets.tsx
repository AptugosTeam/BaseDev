/*
path: 999_sockets.js
completePath: elements/Experimental/Sockets/999_sockets.js
unique_id: Wq86Z8m6
internalUse: true
*/
import { Server } from 'socket.io'

export const config = {
  api: {
    bodyParser: false,
  },
}

const SocketHandler = (req, res) => { 
  if (res.socket.server.io) {
    console.log('Socket is already running')
  } else {
    console.log('Socket is initializing')
    const io = new Server(res.socket.server)

    io.on('connection', socket => {
      console.log('A user connected:', socket.id)
      
      socket.emit('message', { author: 'System', content: 'Welcome to the chat!' })

      socket.on('message', msg => {
        console.log('Received message:', msg)
        io.emit('message', msg)
      })

      socket.on('disconnect', () => {
        console.log('User disconnected:', socket.id)
        io.emit('message', { author: 'System', content: 'A user left the chat.' })
      })
    })

    res.socket.server.io = io
  }

  res.end()
}

export default SocketHandler





// const uuidv4 = require('uuid').v4

// const messages = new Set()
// const users = new Map()
// const messageExpirationTimeMS = 5*60 * 1000;
// const defaultUser = {
//   id: 'anon',
//   name: 'Anonymous',
// }

// {% for delay in delayed %}
//   {% for specificDelay in delay.beforeClassDefinition %}
//     {{ specificDelay }}
//   {% endfor %}
// {% endfor %}

// class Connection {
//   constructor(io, socket) {
//     this.socket = socket
//     this.io = io
//     {% for delay in delayed %}
//       {% for specificDelay in delay.theconstructor %}
//         {{ specificDelay }}
//       {% endfor %}
//     {% endfor %}
//     socket.on('getUsers', () => this.getUsers())
//     socket.on('getMessages', () => this.getMessages())
//     socket.on('message', (value) => this.handleMessage(value))
//     socket.on('disconnect', () => this.disconnect())
//     socket.on('connect_error', (err) => {
//       console.log(`connect_error due to ${err.message}`)
//     });
//   }

//   getUsers() {
//     const theUsers = []
//     for (let [id, socket] of this.io.of('/').sockets) {
//       theUsers.push({ userID: id, username: socket.username || 'Anonymous' })
//     }
//     this.io.emit('users', theUsers)
//   }
  
//   sendMessage(message) {
//     {% for delay in delayed %}
//       {% for specificDelay in delay.onsendmessage %}
//         {{ specificDelay }}
//       {% endfor %}
//     {% endfor %}
//     this.io.sockets.emit('message', message);
//   }
  
//   getMessages() {
//     let msgs = [...messages]
//     {% for delay in delayed %}
//       {% for specificDelay in delay.ongetmessages %}
//         {{ specificDelay }}
//       {% endfor %}
//     {% endfor %}
//     msgs.forEach((message) => this.sendMessage(message));
//   }

//   handleMessage(value) {
//     console.log(this.socket)
//     const message = {
//       id: uuidv4(),
//       user: users.get(this.socket) || { ...defaultUser, name: 'Anonymous ' + users.size },
//       value,
//       time: Date.now()
//     }

//     {% for delay in delayed %}
//       {% for specificDelay in delay.onhandlemessage %}
//         {{ specificDelay }}
//       {% endfor %}
//     {% endfor %}
//     messages.add(message)
//     this.sendMessage(message)

//     setTimeout(
//       () => {
//         messages.delete(message)
//         this.io.sockets.emit('deleteMessage', message.id)
//       },
//       messageExpirationTimeMS,
//     );
//   }

//   disconnect() {
//     users.delete(this.socket)
//   }
// }

// function chat(io) {
//   io.on('connection', (socket) => {
//     new Connection(io, socket)
//   });
// };

// module.exports = chat