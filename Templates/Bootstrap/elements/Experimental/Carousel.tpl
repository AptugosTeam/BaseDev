/*
path: Carousel.tpl
type: file
unique_id: oKi37bpk
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
*/

{% set bpr %}
import Carousel from '../components/Carousel/Carousel'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<Carousel
    height='{{ element.values.height }}'
    {% if element.values.autoplay %}autoPlay={true}{% else %}autoPlay={false}{% endif %}
    arrowsOrDotsMethod='{{ element.values.arrowsOrDotsMethod }}'
    {% if element.values.showSlide %}showSlide={ {{ element.values.showSlide }} }{% endif %}
>   
    {{ content | raw }}
</Carousel>