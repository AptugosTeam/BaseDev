/*
path: Swiper.tpl
completePath: elements/Experimental/Swiper/Swiper.tpl
type: file
unique_id: oKJIl4pk
icon: f:Swiper.png
sourceType: javascript
options:
  - name: ClassName
    display: ClassName
    type: styles 
    options: ''
  - name: slidesPerView
    display: slides Per View
    type: text
    options: ''
  - name: slidesPerGroup
    display: Slides Per Group
    type: text
    options: ''
  - name: spaceBetween
    display: Space Between
    type: text
    options: ''
  - name: width
    display: Width
    type: text
    options: ''
  - name: style
    display: height
    type: text
    options: ''
  - name: loop
    display: loop
    type: checkbox
    advanced: true
    options: ''
  - name: loopFillGroupWithBlank
    display: Blanks
    type: checkbox
    advanced: true
    options: ''
  - name: navigation
    display: Delete arrows
    type: checkbox
    options: ''
    value: '"swiper": "^8.0.0",'
children: []
*/
{% set bpr %}
import { Swiper, SwiperSlide } from "swiper/react";
import { Pagination, Navigation } from "swiper";
import "swiper/css";
import "swiper/css/pagination";
import "swiper/css/free-mode";
import "swiper/css/bundle";
{% endset %}

{{ save_delayed('bpr', bpr) }}    
  <Swiper
    {% if element.values.ClassName %}
      className={ {{ element.values.ClassName }} } 
    {% endif %}
    {% if element.values.slidesPerView %}
      slidesPerView={ {{ element.values.slidesPerView }} }
    {% endif %}
    {% if element.values.spaceBetween %}
      spaceBetween={ {{ element.values.spaceBetween }} } 
    {% endif %}
    {% if element.values.slidesPerGroup %}
      slidesPerGroup={ {{ element.values.slidesPerGroup }} }
    {% endif %}
    {% if element.values.loop %}
      loop={false}
    {% else %}
      loop={true}
    {% endif %}
    {% if element.values.navigation %}
      navigation={false}
    {% else %}
      navigation={true}
    {% endif %}
    {% if element.values.loopFillGroupWithBlank %}
      loopFillGroupWithBlank={true}
    {% else %}
      loopFillGroupWithBlank={false}
    {% endif %}
    {% if element.values.width %}
      width={ {{ element.values.width }} }
    {% endif %}
    {% if element.values.style %}
      style={ { height:{{element.values.style}} } }
    {% endif %}
    pagination=  { {clickable: true} }
    modules={[Pagination, Navigation]}
  >

  {% for unchild in element.children %}
    <SwiperSlide>
      {{ unchild.rendered | raw }}
    </SwiperSlide>
  {% endfor %}

</Swiper>

  