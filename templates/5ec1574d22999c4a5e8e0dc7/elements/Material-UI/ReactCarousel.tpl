/*
path: ReactCarousel.tpl
type: file
unique_id: oKi37car
icon: ico-carousel
sourceType: javascript
options:
  - name: ClassName
    display: ClassName
    type: styles
    options: ''
  - name: sx
    display: Width
    type: styles
    options: ''
  - name: Height
    display: Height
    type: text
    options: ''
  - name: autoplay
    display: Autoplay
    type: checkbox
    options: ''
  - name: navButtonsAlwaysVisible
    display: Use Arrows?
    type: checkbox
    options: ''
  - name: onChange
    display: On Change
    type: code
    options: ''
  - name: showSlide
    display: Slide number to show
    type: text
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
{% if element.values.Height %}height= { {{ element.values.Height }} } {% endif %} 
{% if element.values.autoplay %}autoPlay={true}{% else %}autoPlay={false}{% endif %}
{% if element.values.onChange %}onChange={ {{ element.values.onChange }} }{% endif %}
{% if element.values.navButtonsAlwaysVisible %}navButtonsAlwaysVisible={true}{% else %}navButtonsAlwaysVisible={false}{% endif %}
{% if element.values.sx %}sx={ { width:{{element.values.sx}} } }{% endif %}
>   
{{ content | raw }}
</Carousel>  