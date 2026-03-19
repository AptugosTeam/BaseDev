/*
path: checkForErrors.tpl
type: file
unique_id: MHrE5ycl
icon: ico-field
helpText: Shows a snackbar with the error message from the controller
children: []
options:
  - name: table
    display: Table
    type: dropdown
    options: >-
      return [['var','Use a
      variable'],...aptugo.store.getState().application.tables.map(({ unique_id,
      name }) => [unique_id, name])]
  - name: position
    display: Position
    type: dropdown
    options: Top-Left;Top-Center;Top-Right;Bottom-Left;Bottom-Center;Bottom-Right
*/
{% set table = element.values.table | tableData %}
{% set friendlyTableName = table.name | friendly | capitalize %}
{% set dialogVariable = 'dialog' ~ friendlyTableName ~ 'Action' %}
{% set element = element|merge({'values': (element.values | merge({'severity': 'error', 'varName': table.name|friendly|lower ~ 'snackbar' })) }) %}
{% set ph %}
React.useEffect(() => {
  if ({{ table.name|friendly|lower }}Data.errStatus) {
    if ({{ table.name|friendly|lower }}Data.errStatus !== 200) {
      set{{element.values.varName}}(true)
    } else {
      typeof set{{ dialogVariable }} !== 'undefined' && set{{ dialogVariable }}('')
    }
  }
},[{{ table.name|friendly|lower }}Data.errStatus])
{% endset %}
{{ save_delayed('ph',ph, 10) }}
{% set content %}
<div>{ {{ table.name|friendly|lower }}Data.errMessage }</div>
{% endset %}
{% set content %}
{% include includeTemplate('alertMessage.tpl') %}
{% endset %}
{% include includeTemplate('snackbar.tpl') %}