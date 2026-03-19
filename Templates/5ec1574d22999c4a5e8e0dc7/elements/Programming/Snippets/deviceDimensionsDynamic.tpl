/*
path: deviceDimensionsDynamic.tpl
type: file
unique_id: deviceDimensionsDynamic
icon: f:MdiMonitorCellphone.svg
sourceType: javascript
options:
  - name: variableName
    display: Variable Name
    type: text
children: []
*/
{% set ph %}
const [{{ element.values.variableName }}, set{{ element.values.variableName }}] = React.useState<{{ 'any' }}>({ width: window.innerWidth, height: window.innerHeight })
{% endset %}
{{ save_delayed('ph', ph ) }}

React.useEffect(() => {
  const handleResize = () => {
    set{{ element.values.variableName }}((prev) => ({
      ...prev,
      width: window.innerWidth,
      height: window.innerHeight,
    }))
  }

  window.addEventListener('resize', handleResize)

  return () => window.removeEventListener('resize', handleResize)
}, [])