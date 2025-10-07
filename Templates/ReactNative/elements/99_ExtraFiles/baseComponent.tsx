/*
path: baseComponent.tsx
keyPath: elements/Programming/baseComponent.tsx
unique_id: spqWQO2m
internalUse: true
*/
import React, { FunctionComponent } from 'react'
import baseClasses from '@components/Themes/layout.module.scss'

{% for child in element.children %}
    {% if child.value == 'componentBeforePageRender' %} 
      {{ child.rendered }}  
    {% endif %}
  {% endfor %}

{% for delay in delayed %}
  {% for specificDelay in delay.bpr %}
    {{ specificDelay }}
  {% endfor %}
{% endfor %}

const AptugoComponent: FunctionComponent<any> = (props) => {
  {% if element.values.props %}const { {{ element.values.keyprops|default(element.values.props) }} } = props?.properties || {}{% endif %}

  {% set combinedContent = [] %}
  {% set seenLines = {} %}
  
  {% set tempCombined = combinedContent %}
  {% set tempSeen = seenLines %}
  {% for child in element.children %}
    {% if child.value == 'componentHeader' %}
      {% set lines = child.rendered|split("\n") %}
      {% for line in lines %}
        {% set trimmedLine = line|trim %}
        {% if trimmedLine != "" and (trimmedLine not in tempSeen) %}
          {% set tempCombined = tempCombined|merge([trimmedLine]) %}
          {% set tempSeen = tempSeen|merge({ (trimmedLine): true }) %}
        {% endif %}
      {% endfor %}
    {% endif %}
  {% endfor %}
  {% set combinedContent = tempCombined %}
  {% set seenLines = tempSeen %}

  {% set tempCombined = combinedContent %}
  {% set tempSeen = seenLines %}

  {% for delay in delayed %}
    {% for specificDelay in delay.ph %}
      {% set lines = specificDelay|split("\n") %}
      {% for line in lines %}
        {% set trimmedLine = line|trim %}
        {% if trimmedLine != "" and (trimmedLine not in tempSeen) %}
          {% set tempCombined = tempCombined|merge([trimmedLine]) %}
          {% set tempSeen = tempSeen|merge({ (trimmedLine): true }) %}
        {% endif %}
      {% endfor %}
    {% endfor %}
  {% endfor %}
  {% set combinedContent = tempCombined %}
  {% set seenLines = tempSeen %}
  
  {{ combinedContent|join("\n")|raw }}
  
  return (<React.Fragment>
    {% for child in element.children %}
    {% if child.value == 'componentBody' %} 
      {{ child.rendered }}  
    {% endif %}
  {% endfor %}
  </React.Fragment>)
}

export default AptugoComponent
