/*
path: sectionGrid.tpl
type: file
unique_id: sectionGrid
icon: ico-div
double: true
color: rgb(0,230,230)
backColor: rgba(6, 201, 210, 0.25)
sourceType: javascript
options:
  - name: class
    display: ClassName
    type: styles
    options: ''
  - name: backgroundColor
    display: Background Color
    type: color
  - name: backgroundMedia
    display: Background Media
    type: media
*/
{% set className = element.values.class|default('theme.gridSection') %}
<section className={ {{ className }} }>
  <div className={theme.background}>
    {% if element.values.backgroundMedia %}
      {% if element.values.backgroundMedia.type == 'video' %}
        <video loop muted autoPlay style={ { width: '100%', height: '100%', objectFit: 'cover', objectPosition: '50% 50%'} }>
          <source src='{{ element.values.backgroundMedia.file }}' />
        </video>
      {% else %}
        <img src='{{ element.values.backgroundMedia.file }}' style={ { width: '100%', height: '100%', objectFit: 'cover', objectPosition: '50% 50%'} }/>
      {% endif %}
    {% endif %}
  </div>
  <div className={theme.content}>
    {{ content | raw }}
  </div>
</section>