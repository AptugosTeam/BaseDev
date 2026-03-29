/*
path: baseComponent.tsx
keyPath: elements/Programming/baseComponent.tsx
unique_id: spqWQO2m
internalUse: true
*/
import React, { FunctionComponent } from 'react'
import baseClasses from '@components/Themes/layout.module.scss'

{% for delay in delayed %}
  {% for specificDelay in delay.bpr %}
    {{ specificDelay }}
  {% endfor %}
{% endfor %}

{% for child in element.children %}
    {% if child.value == 'componentBeforePageRender' %} 
      {{ child.rendered }}  
    {% endif %}
{% endfor %}

const AptugoComponent: FunctionComponent<{{element.values.interface|default('any')}}> = (props) => {
  {% if element.values.props %}const { {{ element.values.keyprops|default(element.values.props) }} } = props?.properties || {}{% endif %}

  {% set combinedContent = [] %}
  {% set seenBlocks = {} %}
  
  {% set tempCombined = combinedContent %}
  {% set tempSeen = seenBlocks %}

  {% for delay in delayed %}
    {% for specificDelay in delay.ph %}
      {% set trimmedBlock = specificDelay|trim %}
      {% if trimmedBlock != "" and (trimmedBlock not in tempSeen) %}
        {% set tempCombined = tempCombined|merge([trimmedBlock]) %}
        {% set tempSeen = tempSeen|merge({ (trimmedBlock): true }) %}
      {% endif %}
    {% endfor %}
  {% endfor %}
  {% set combinedContent = tempCombined %}
  {% set seenBlocks = tempSeen %}
  
  {% set tempCombined = combinedContent %}
  {% set tempSeen = seenBlocks %}
  {% for child in element.children %}
    {% if child.value == 'componentHeader' %}
      {% set trimmedBlock = child.rendered|trim %}
      {% if trimmedBlock != "" and (trimmedBlock not in tempSeen) %}
        {% set tempCombined = tempCombined|merge([trimmedBlock]) %}
        {% set tempSeen = tempSeen|merge({ (trimmedBlock): true }) %}
      {% endif %}
    {% endif %}
  {% endfor %}
  {% set combinedContent = tempCombined %}
  {% set seenBlocks = tempSeen %}

  {% set renderedContent = '' %}
  {% for block in combinedContent %}
    {% set currentIsMultiline = block|split("\n")|length > 1 %}
    {% if loop.first %}
      {% set renderedContent = block %}
    {% else %}
      {% set previousBlock = combinedContent[loop.index0 - 1] %}
      {% set previousIsMultiline = previousBlock|split("\n")|length > 1 %}
      {% if previousIsMultiline or currentIsMultiline %}
        {% set renderedContent = renderedContent ~ '\n\n' ~ block %}
      {% else %}
        {% set renderedContent = renderedContent ~ '\n' ~ block %}
      {% endif %}
    {% endif %}
  {% endfor %}

  {{ renderedContent|raw }}
  
  return (<React.Fragment>
    {% for child in element.children %}
    {% if child.value == 'componentBody' %} 
      {{ child.rendered }}  
    {% endif %}
  {% endfor %}
  </React.Fragment>)
}

export default AptugoComponent
