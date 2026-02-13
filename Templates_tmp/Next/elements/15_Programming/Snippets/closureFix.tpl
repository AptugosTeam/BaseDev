/*
path: closureFix.tpl
type: file
unique_id: closfix
icon: ico-field
sourceType: javascript
options:
  - name: variableName
    display: Store In
    type: dropdown
    options: >-
      return [...aptugoUtils.variables.retrievePageVariablesFromElement(arguments[0]).filter(rpvfe => rpvfe.type === 'Variable').map(({ unique_id, name }) => [unique_id, name])]
children: []
*/
{% set varName = (element.values.variableName | elementData).values.variableName %}
const {{ varName }}Ref = React.useRef({{ varName }})
React.useEffect(() => {
    {{ varName }}Ref.current = {{ varName }}
}, [{{ varName }}])