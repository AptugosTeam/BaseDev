/*
path: baseComponent.tsx
keyPath: elements/Programming/baseComponent.tsx
unique_id: spqWQO2m
internalUse: true
*/
import React, { FunctionComponent } from 'react'
import { useRouter } from 'next/router'
{% for delay in delayed %}
  {% for specificDelay in delay.bpr %}
    {{ specificDelay }}
  {% endfor %}
{% endfor %}

const AptugoComponent: FunctionComponent<any> = (props) => {
  {% if element.values.props %}const { {{ element.values.keyprops|default(element.values.props) }} } = props.properties{% endif %}
  const router = useRouter()
  {% for child in element.children %}
    {% if child.value == 'componentHeader' %} 
      {{ child.rendered }}
    {% endif %}
  {% endfor %}

  return (<React.Fragment>
    {% for child in element.children %}
    {% if child.value == 'componentBody' %} 
      {{ child.rendered }}
    {% endif %}
  {% endfor %}
  </React.Fragment>)
}

export default AptugoComponent
