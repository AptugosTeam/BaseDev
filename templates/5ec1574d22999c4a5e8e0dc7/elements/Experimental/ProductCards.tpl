/*
path: ProductCards.tpl
type: file
unique_id: oKJIl4pk
icon: ico-carousel
sourceType: javascript
options:
  - name: ClassName
    display: ClassName
    type: styles
    options: ''
  - name: slidesPerView
    display: slidesPerView
    type: text
    options: ''
  - name: spaceBetween
    display: spaceBetween
    type: text
    options: ''
  - name: slidesPerGroup
    display: slidesPerGroup
    type: text
    options: ''
  - name: loop
    display: loop
    type: checkbox
    options: ''
  - name: loopFillGroupWithBlank
    display: loopFillGroupWithBlank
    type: checkbox
    options: ''
  - name: navigation
    display: navigation
    type: checkbox
    options: ''
  - name: bundle
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
{% if element.values.bundle %}//import "swiper/css/bundle{% else %}import "swiper/css/bundle{% endif %}";
{% endset %}
{{ save_delayed('bpr', bpr) }}
  <Swiper
    {% if element.values.ClassName %}className={ {{ element.values.ClassName }} } {% endif %}
    {% if element.values.slidesPerView %}slidesPerView={ {{ element.values.slidesPerView }} } {% endif %}
    {% if element.values.spaceBetween %}spaceBetween={ {{ element.values.spaceBetween }} } {% endif %}
    {% if element.values.slidesPerGroup %}slidesPerGroup={ {{ element.values.slidesPerGroup }} } {% endif %}
    {% if element.values.loop %}loop={true}{% else %}loop={false}{% endif %}
    {% if element.values.navigation %}navigation={false}{% else %}navigation={true}{% endif %}
    {% if element.values.loopFillGroupWithBlank %}loopFillGroupWithBlank={true}{% else %}loopFillGroupWithBlank={false}{% endif %}
    pagination=  { {clickable: true} }
    modules={[Pagination, Navigation]}
  >  
    <SwiperSlide
    
    >
      {{ content | raw }}
    </SwiperSlide>
  </Swiper>