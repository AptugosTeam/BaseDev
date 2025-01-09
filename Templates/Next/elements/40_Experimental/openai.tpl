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
    value: '"openai": "^4.77.0","ws":"^8.18.0",'
extraFiles:
  - source: 'elements/99_ExtraFiles/900_openai.js'
    destination: 'src/lib/openai.js'
*/
{# {{ add_setting(tableSingleName ~ '_File_Start', 'import callAI from '@lib/openai')}} #}
