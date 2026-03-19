/*
path: navbar.tpl
type: file
unique_id: DgXmELX2
icon: ico-navbar
helpText: Navigation bar component
options:
  - name: ClassName
    display: ClassName
    type: styles
    options: ''
  - name: ScrolledClassName
    display: ClassName (when scrolled)
    type: styles
    options: ''
  - name: scrollWait
    display: Wait to scroll (pixels)
    type: text
    settings:
      propertyCondition: ScrolledClassName
sourceType: javascript
children: []
*/
{% set className = element.values.ClassName %}
{% if element.values.ScrolledClassName %}
  {% set className = 'navBarClassName' %}
  {% set bpr %}
    import { useState, useEffect } from 'react'
  {% endset %}
  {{ save_delayed('bpr',bpr) }}
  {% set ph %}
    const [navBarClassName, setnavBarClassName] = useState({{ element.values.ClassName }})
    
    useEffect(() => {
      const handleScroll = () => {
        if (window.scrollY > {{ element.values.scrollWait|default(100)}}) {
        setnavBarClassName({{ element.values.ScrolledClassName }})
      } else {
        setnavBarClassName({{ element.values.ClassName }})
      }
    };

    window.addEventListener('scroll', handleScroll)

    return () => {
      window.removeEventListener('scroll', handleScroll)
    }
  }, [])
  {% endset %}
  {{ save_delayed('ph',ph) }}
{% endif %}
<header {% if element.values.ClassName %}className={ {{ className }} }{% endif %}>
  {{ content | raw }}
</header>
