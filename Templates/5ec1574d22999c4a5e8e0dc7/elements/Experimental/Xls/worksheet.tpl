/*
path: worksheet.tpl
keyPath: elements/Experimental/Xls/worksheet.tpl
unique_id: s0aqDa3y
options:
  - name: sheetName
    display: Sheet Name
    helpText: Specifies the name of the sheet
    type: text
    options: ''
    settings:
      default: 'Sheet1'
  - name: sheetVariableName
    display: Sheet Variable Name
    helpText: Specifies the variable name to be used when dealing with this worksheet
    type: text
    options: ''
    advanced: true
    settings:
      default: 'ws'
  - name: bookVariableName
    display: Workbook Variable Name
    helpText: Specifies the variable name for the worksheet to interact with
    type: text
    options: ''
    advanced: true
    settings:
      default: 'wb'
*/
const {{ element.values.sheetVariableName | default('ws') }} = {{ element.values.bookVariableName | default('wb') }}.addWorksheet({{ element.values.sheetName | textOrVariableInCode | default('Sheet1') }})
{{ content | raw }}