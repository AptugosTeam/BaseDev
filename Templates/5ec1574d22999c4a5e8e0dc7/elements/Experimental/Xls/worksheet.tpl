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
  - name: dataVariable
    display: Data variable used in the file
    helpText: This is to define the header cells
    type: text
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
const headers = Object.keys({{ element.values.dataVariable | textOrVariableInCode }}[0]);

headers.forEach((header, index) => {
  ws.cell(1, index + 1).string(header);  // index + 1 porque Excel usa índices 1-based
});
{{ content | raw }}