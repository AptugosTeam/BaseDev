/*
path: 900_openai.js
completePath: /Users/Shared/Dev/BaseDev/Templates/Next/elements/99_ExtraFiles/900_openai.js
keyPath: elements/99_ExtraFiles/900_openai.js
unique_id: BUqPR6sD
*/

const callAI = (options, callHistory = []) => {
  console.log('1 - Preparing call to IA', options.messages)
  return new Promise((resolve,reject) => {
    console.log('1.1 - About to call')
    openai.chat.completions.create(options)
      .then(async responseWithChoices => {
        console.log('1.9 - About to parse')
        const response = responseWithChoices.choices[0]
        var toolResponse = ''
        console.log('2 - Got a response from IA', JSON.stringify(response.message,null,2))
        if (response.message.tool_calls) {
          for (var toolCall of response.message.tool_calls) {
            const params = JSON.parse(toolCall.function.arguments)
            const functName = toolCall.function.name

            // if (callHistory.length > 10) {
            //   return Promise.reject(new Error("Potential infinite loop detected"))
            // }
            callHistory.push(functName)

            let funct = null 
            if (functName === 'createApp') funct = createApp
            else if (functName === 'createTable') funct = createTable
            else if (functName === 'updateTable') funct = updateTable
            else if (functName === 'createPage') funct = createPage
            else if (functName === 'createElement') funct = createElement
            else if (functName === 'navigateToURL') funct = navigateToURL
            console.log('2.1 - Calling function', functName, ' with this params: ', JSON.stringify(params), 'funct is', funct)
            const functResult = await funct(params, activeApp, sendData)
            console.log('2.2 - Function result', functResult)
            if (functName !== 'navigateToURL') {
              activeApp = functResult
              toolResponse = JSON.stringify(activeApp)
            } else {
              toolResponse = functResult
            }
          }

          try {
            const respo = await callAI({
              ...options,
              messages: [
                ...options.messages.filter(msg => {
                  return msg.role === 'assistant' || msg.role === 'tool'
                }),
                { role: "assistant", tool_calls: [toolCall] },
                { role: "tool", content: toolResponse, tool_call_id: toolCall.id }
              ]
            }, callHistory) 
            resolve( respo )
          } catch (e) {
            reject(e )
          }
        } else {
          resolve(response)
        }
      })
      .catch(error => {
        console.log('open ia error', error)
        reject(error)
      })  
  })
}

export default callAI