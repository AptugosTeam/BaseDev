/*
path: baseComponent.tsx
completePath: >-
  C:\Users\Usuario\Aptugo\BaseDev\Templates\ReactNative\elements\Programming\baseComponent.tsx
keyPath: elements\Programming\baseComponent.tsx
unique_id: zOyD6TiD
*/
import React, { 
  FunctionComponent, 
  forwardRef, 
  useImperativeHandle 
} from 'react'
import baseClasses from '@components/Themes/layout.module.scss'
{% for delay in delayed %}
  {% for specificDelay in delay.bpr %}
    {{ specificDelay }}
  {% endfor %}
{% endfor %}


{% for child in element.children %}
  {% if child.value == 'componentBeforeRender' %} 
    {{ child.rendered }}
  {% endif %}
{% endfor %}

{% set headerContent = [] %}
{% for child in element.children %}
  {% if child.value == 'componentHeader' %}
    {% set trimmedContent = child.rendered|trim %}
    {% if trimmedContent != "" %}
      {% set headerContent = headerContent|merge([trimmedContent]) %}
    {% endif %}
  {% endif %}
{% endfor %}

{% set delayedContent = [] %}
{% for delay in delayed %}
  {% for specificDelay in delay.ph %}
    {% set trimmedContent = specificDelay|trim %}
    {% if trimmedContent != "" %}
      {% set delayedContent = delayedContent|merge([trimmedContent]) %}
    {% endif %}
  {% endfor %}
{% endfor %}

{% set combinedContent = headerContent|merge(delayedContent) %}

{% if element.values.useForwardRef %}

const AptugoComponent = forwardRef<{{ element.values.refType | default('any') }}, {{ element.values.propsType | default('any') }}>((props, ref) => {
  {% if element.values.props %}const { {{ element.values.keyprops|default(element.values.props) }} } = props?.properties || {}{% endif %}
  
  {{ combinedContent|reverse|join("\n\n")|raw }}

  return (<React.Fragment>
    {% for child in element.children %}
      {% if child.value == 'componentBody' %} 
        {{ child.rendered }}  
      {% endif %}
    {% endfor %}
  </React.Fragment>)
});

{% else %}

const AptugoComponent: FunctionComponent<any> = (props) => {
  {% if element.values.props %}const { {{ element.values.keyprops|default(element.values.props) }} } = props?.properties || {}{% endif %}
  
  {{ combinedContent|reverse|join("\n\n")|raw }}
  
  return (<React.Fragment>
    {% for child in element.children %}
      {% if child.value == 'componentBody' %} 
        {{ child.rendered }}  
      {% endif %}
    {% endfor %}
  </React.Fragment>)
}

{% endif %}

{% for child in element.children %}
  {% if child.value == 'componentAfterRender' %} 
    {{ child.rendered }}
  {% endif %}
{% endfor %}

export default AptugoComponent