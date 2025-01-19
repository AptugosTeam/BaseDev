/*
path: 900_openai.js
keyPath: elements/99_ExtraFiles/900_openai.js
unique_id: BUqPR6sD
*/
const callAI = (ia, functions, options, callHistory = []) => {
  // console.log('  >> got this options', JSON.stringify(options.messages, null, 2))
  return new Promise((resolve, reject) => {
    ia.chat.completions
      .create(options)
      .then(async (responseWithChoices) => {
        const response = responseWithChoices.choices[0]
        var functResult = ''
        if (response.message.tool_calls) {
          for (var toolCall of response.message.tool_calls) {
            try {
              const params = JSON.parse(toolCall.function.arguments)
              const functName = toolCall.function.name

              callHistory.push(functName)

              let funct = functions[functName]
              // console.log('  >> calling function: ', functName)
              functResult = await funct(params)
            } catch (e) {
              console.info(' >> ERROR: tried to call funct, didnt work:', toolCall.function.arguments, toolCall.function.name)
              console.error('  >> Function calling error:', e)
            }
          }

          try {
            const respo = await callAI(
              ia,
              functions,
              {
                ...options,
                messages: [
                  ...options.messages.filter((msg) => {
                    return msg.role === 'assistant' || msg.role === 'tool'
                  }),
                  { role: 'assistant', tool_calls: [toolCall] },
                  { role: 'tool', content: JSON.stringify(functResult), tool_call_id: toolCall.id },
                ],
              },
              callHistory,
            )

            resolve({ ...respo, usage: responseWithChoices.usage })
          } catch (e) {
            reject(e)
          }
        } else {
          resolve({ ...response, usage: responseWithChoices.usage })
        }
      })
      .catch((error) => {
        console.error('open ia error', error)
        reject(error)
      })
  })
}

export default callAI
