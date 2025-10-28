/*
path: openai.tpl
keyPath: elements/40_Experimental/openai.tpl
unique_id: pXMZKkLs
options:
  - name: openAIKey
    display: OpenAI Key
    type: text
settings:
  - name: Packages
    value: '"openai": "5.20.2",'
extraFiles:
  - source: 'elements/99_ExtraFiles/500_openaiIndex.tsx'
    destination: 'src/api-lib/index.tsx'
  - source: 'elements/99_ExtraFiles/500_openaiMiddleware.tsx'
    destination: 'src/api-lib/middleware.tsx'
  - source: 'elements/99_ExtraFiles/500_openaiPipelines.tsx'
    destination: 'src/api-lib/pipelines.tsx'
  - source: 'elements/99_ExtraFiles/500_openaiTasks.tsx'
    destination: 'src/api-lib/tasks.tsx'
*/

// OpenAI 5.20.2 enabled