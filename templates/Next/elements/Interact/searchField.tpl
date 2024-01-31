/*
path: searchField.tpl
type: file
unique_id: i13FZRpA
icon: f:searchField.svg
helpText: Adds a search field and performs searches on a specific table when changed
children: []
options:
  - name: table
    display: Table
    type: dropdown
    options: >-
      return [['var','Use a
      variable'],...aptugo.store.getState().application.tables.map(({ unique_id,
      name }) => [unique_id, name])]
  - name: avoidLoad
    display: Do not load data
    type: checkbox
  - name: placeholderText
    display: Placeholder Text
    type: text
  - name: searchField
    display: Search Field
    type: dropdown
    options: return [['useVar','Use a Variable'], ...aptugo.tableUtils.getAllFields()]
  - name: updateVarName
    display: Update Variable Name
    type: dropdown
    options: >-
      return [['default','Use default name'], ...aptugo.variables.variables.filter(v => v.type !== 'Function').map(v => [v.name, v.name])]
  - name: updateFunctionName
    display: Update Function Name
    type: dropdown
    options: >-
      return [['default','Use default name'], ...aptugo.variables.variables.filter(v => v.type === 'Function').map(v => [v.name, v.name])]
*/
