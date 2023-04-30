#!/usr/bin/env node
const init = require('../')

init().then(res => {
  if (!res) return
  if (res.exitCode !== null) {
    if (res.exitCode === 0) {
      console.log(res.data)
    } else {
      console.log(res)
    }
  } else {
    console.log(res)
  }
}).catch(e => {
  console.error(e)
})