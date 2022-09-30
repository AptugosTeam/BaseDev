/*
path: Swiper.tpl
completePath: elements/Experimental/Swiper.tpl
type: file
unique_id: oKJIl4pk
icon: f:Swiper.svg
sourceType: javascript
options:
  - name: ClassName
    display: ClassName
    type: styles 
    options: ''
  - name: slidesPerView
    display: Slides Per View
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
    display: Height
    type: text
    options: ''
  - name: loop
    display: Loop
    type: checkbox
    advanced: true
    options: ''
  - name: loopFillGroupWithBlank
    display: Blanks
    type: checkbox
    advanced: true
    options: ''
  - name: navigation
    display: Delete Arrows
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
      loopFillGroupWithBlank={false}
    {% else %}
      loopFillGroupWithBlank={true}
    {% endif %}
    {% if element.values.width %}
      style={ { height: {{element.values.style}} , width:{{element.values.width}} } }
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

  