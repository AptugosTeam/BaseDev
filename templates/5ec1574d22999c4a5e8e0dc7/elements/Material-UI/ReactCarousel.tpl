/*
path: ReactCarousel.tpl
type: file
unique_id: oKi37car
icon: f:ReactCarousel.svg
sourceType: javascript
options:
  - name: ClassName
    display: ClassName
    type: styles
    options: ''
  - name: onChange
    display: On Change
    type: code
    advanced: true
    options: ''
  - name: sx
    display: Width
    type: text
    options: ''
  - name: Height
    display: Height
    type: text
    options: ''
  - name: animation
    display: Animation fade(default)
    type: dropdown
    advanced: true
    options: fade;slide
  - name: duration
    display: Duration
    type: text
    advanced: true
    options: ''
  - name: autoplay
    display: Autoplay
    type: checkbox
    options: ''
  - name: navButtonsAlwaysVisible
    display: Arrows Visible
    type: checkbox
    options: ''
  - name: navButtonsAlwaysInvisible
    display: Remove arrows
    type: checkbox
    options: ''
  - name: indicators
    display: Remove indicators
    type: checkbox
    options: ''
children: []
settings:
  - name: Packages
    value: '"react-material-ui-carousel": "^3.2.0",'
*/
{% set bpr %}
import Carousel from 'react-material-ui-carousel'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<Carousel 
{% if element.values.ClassName %}className={ {{ element.values.ClassName }} } {% endif %}  
{% if element.values.Height %}height= { {{ element.values.Height }} }{% else %}height= { {{ 500 }} } {% endif %} 
{% if element.values.navButtonsAlwaysVisible %}navButtonsAlwaysVisible={true}{% else %}navButtonsAlwaysVisible={false}{% endif %}
{% if element.values.autoplay %}autoPlay={true}{% else %}autoPlay={false}{% endif %}
{% if element.values.onChange %}onChange={ {{ element.values.onChange }} }{% endif %}
{% if element.values.sx %}sx={ { width:{{element.values.sx}} } }{% else %}sx={ { width:{{550}} } }{% endif %}
{% if element.values.indicators %}indicators={false}{% else %}indicators={true}{% endif %}
{% if element.values.navButtonsAlwaysInvisible %}navButtonsAlwaysInvisible={true}{% else %}navButtonsAlwaysInvisible={false}{% endif %}
{% if element.values.duration %}duration= { {{ element.values.duration }} } {% endif %}
{% if element.values.animation %}animation= '{{ element.values.animation }}' {% else %}animation=  "fade"  {% endif %} 
>   
{{ content | raw }}
</Carousel>  