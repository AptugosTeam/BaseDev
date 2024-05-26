/*
path: cell.tpl
keyPath: elements/Experimental/Xls/cell.tpl
unique_id: yFO3SNge
options:
  - name: startRow
    display: Start Row
    helpText: Specifies the starting row for your cell (number, 1 is first)
    type: text
    options: ''
    settings:
      default: '1'
  - name: startCol
    display: Start Column
    helpText: Specifies the starting column for your cell (number, 1 is first)
    type: text
    options: ''
    settings:
      default: '1'
  - name: type
    display: Cell Type
    helpText: Specifies the cell type for formatting
    type: dropdown
    options: 
      return [['string', 'Text'],['number', 'Number'],['formula', 'Formula'],['date', 'Date'],['link', 'Link'],['bool', 'True/False']]
    settings:
      default: 'string'
  - name: value
    display: Value
    helpText: The value for this cell
    type: text
    options: ''
    required: true
  - name: sheetVariableName
    display: Sheet Variable Name
    helpText: Variable name for the WorkSheet containing this cell
    type: text
    options: ''
    advanced: true
    settings:
      default: 'ws'
*/
{{ element.values.sheetVariableName | default('ws') }}.cell({{ element.values.startRow | default('1') }}, {{ element.values.startCol | default('1') }}).{{ element.values.type | default('string') }}({{ element.values.value | textOrVariableInCode }})