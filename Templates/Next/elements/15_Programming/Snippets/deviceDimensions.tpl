/*
path: deviceDimensions.tpl
type: file
unique_id: deviceDimensions
icon: ico-field
sourceType: javascript
options:
  - name: variableName
    display: Store In
    type: text
  - name: isDynamic
    display: Dynamic sizing
    type: checkbox
    options: ''
  - name: shotOnLoad
    display: Check on page load as well
    type: checkbox
children: []
*/
{% if element.values.isDynamic %}
  {% set ph %}
  const [{{ element.values.variableName }}, set{{ element.values.variableName }}] = React.useState<{{ 'any' }}>({ width: null, height: null })
  {% endset %}
  {{ save_delayed('ph', ph ) }}

  React.useEffect(() => {
    set{{ element.values.variableName }}({ width: window.innerWidth, height: window.innerHeight })
    const handleResize = () => {
      {% if element.children %}
        {{ content | raw }}
      {% else %}
        set{{ element.values.variableName }}((prev) => ({
          ...prev,
          width: window.innerWidth,
          height: window.innerHeight,
        }))
      {% endif %}
    }
    window.addEventListener('resize', handleResize)

    {% if element.values.shotOnLoad %}handleResize(){% endif %}
    
    return () => window.removeEventListener('resize', handleResize)
  }, [])
{% else %}
  const {{ element.values.variableName | default('window') }} = { width: window.innerWidth, height: window.innerHeight }
{% endif %}
