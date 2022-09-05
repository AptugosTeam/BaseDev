/*
path: ReactCarousel.tpl
type: file
unique_id: oKi37car
icon: ico-carousel
sourceType: javascript
options:
  - name: height
    display: Height
    type: text
    options: ''
  - name: autoplay
    display: Autoplay
    type: checkbox
    options: ''
  - name: arrowsOrDotsMethod
    display: Use Arrows or Dots?
    type: dropdown
    options: none;arrows;dots
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
<Carousel>   
  {{ content | raw }}
</Carousel>