/*
path: workbook.tpl
keyPath: elements/Experimental/Xls/workbook.tpl
unique_id: Ca0RaKG7
options:
  - name: fileName
    display: Output File Name
    helpText: Defines the name of the file to be generated
    type: text
    settings:
      default: 'ExcelFile.xlsx'
  - name: dateFormat
    display: Date Format
    helpText: Defines the workbook default date format
    type: text
    settings:
      default: 'm/d/yy hh:mm:ss'
  - name: activeTab
    display: Active sheet
    helpText: Specifies an unsignedInt that contains the index to the active sheet in this book view
    type: text
    options: ''
    settings:
      default: '1'
  - name: autoFilterDateGrouping
    display: Auto Filter Date Grouping
    type: checkbox
    helpText: Specifies a boolean value that indicates whether to group dates when presenting the user with filtering options in the user interface
    settings:
      default: true
  - name: useSavingWorkaround
    display: Use Saving Workaround
    type: checkbox
    helpText: Uses an async workaround to wait file to finish saving
    advanced: true
    settings:
      default: false      
settings:
  - name: BackendPackages
    value: '"excel4node": "1.8.2",'
*/
var xl = require('excel4node')
var wb = new xl.Workbook({
  jszip: {
    compression: 'DEFLATE',
  },
  defaultFont: {
    size: 12,
    name: 'Calibri',
    color: 'FFFFFFFF',
  },
  dateFormat: '{{ element.values.dateFormat | default('m/d/yy hh:mm:ss') }}',
  workbookView: {
    activeTab: {{ element.values.activeTab|default('1') }},
    autoFilterDateGrouping: {% if element.values.autoFilterDateGrouping %}true{% else %}false{% endif %},
    firstSheet: 1, // Specifies the index to the first sheet in this book view.
    minimized: false, // Specifies a boolean value that indicates whether the workbook window is minimized.
    showHorizontalScroll: true, // Specifies a boolean value that indicates whether to display the horizontal scroll bar in the user interface.
    showSheetTabs: true, // Specifies a boolean value that indicates whether to display the sheet tabs in the user interface.
    showVerticalScroll: true, // Specifies a boolean value that indicates whether to display the vertical scroll bar.
    tabRatio: 600, // Specifies ratio between the workbook tabs bar and the horizontal scroll bar.
    visibility: 'visible', // Specifies visible state of the workbook window. ('hidden', 'veryHidden', 'visible') (§18.18.89)
    windowHeight: 17620, // Specifies the height of the workbook window. The unit of measurement for this value is twips.
    windowWidth: 28800, // Specifies the width of the workbook window. The unit of measurement for this value is twips..
    xWindow: 0, // Specifies the X coordinate for the upper left corner of the workbook window. The unit of measurement for this value is twips.
    yWindow: 440, // Specifies the Y coordinate for the upper left corner of the workbook window. The unit of measurement for this value is twips.
  },
  logLevel: 0, // 0 - 5. 0 suppresses all logs, 1 shows errors only, 5 is for debugging
  author: 'Microsoft Office User', // Name for use in features such as comments
})
{{ content | raw }}
{% if element.values.useSavingWorkaround %}
  const fsWorkbook = require('fs')
  const buffer = await wb.writeToBuffer()
  await fsWorkbook.writeFile({{ element.values.fileName | default('ExcelFile.xlsx') | textOrVariableInCode }}, buffer, function(err) {
    if (err) throw err
  })
{% else %}
  wb.write({{ element.values.fileName | default('ExcelFile.xlsx') | textOrVariableInCode }})
{% endif %}