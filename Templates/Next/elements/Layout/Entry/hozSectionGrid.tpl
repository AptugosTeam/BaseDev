/*
path: hozSectionGrid.tpl
unique_id: geLAALluT8
styledIcon: f:../../z-images/sectionGrid.jpg
double: true
color: rgb(0,230,230)
backColor: rgba(6, 201, 210, 0.25)
icon: ico-field
hideContent: true
order: 20
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