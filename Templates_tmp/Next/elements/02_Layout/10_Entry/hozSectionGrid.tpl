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
childs:
  - name: Left Section
    element: div
    values: {
      class: 'theme.leftSection'
    }
    childs:
      - name: Main Text
        element: typography
        values: {
          tag: 'h3'
        }
        childs:
          - name: Text
            element: text
            values: {
              Content: 'Main text for section' 
            }
      - name: Secondary Text
        element: typography
        values: {
          tag: 'h5'
        }
        childs:
          - name: Text
            element: text
            values: {
              Content: 'Sub text for section' 
            }
      - name: Action Button
        element: button
        values: {
          ButtonText: 'Action Button',
          Variant: 'contained'
        }
  - name: Right Section
    element: div
    values: {
      class: 'theme.rightSection'
    }
    childs:
      - name: Image
        element: image
        values: {
          path: 'https://picsum.photos/id/28/200/300',
          width: 200
        }
*/
{% set className = element.values.class|default('theme.hozGridSection') %}
{% if element.values.backgroundColor %}
  {% set stylesAdd = 'style={ { backgroundColor: "' ~ element.values.backgroundColor ~ '"} }' %}
{% endif %}
<section className={ {{ className }} } {{stylesAdd}}>
  {% if element.values.backgroundMedia %}
    <div className={theme.background}>  
      {% if element.values.backgroundMedia.type == 'video' %}
        <video loop muted autoPlay style={ { width: '100%', height: '100%', objectFit: 'cover', objectPosition: '50% 50%'} }>
          <source src='{{ element.values.backgroundMedia.file }}' />
        </video>
      {% else %}
        <img src='{{ element.values.backgroundMedia.file }}' style={ { width: '100%', height: '100%', objectFit: 'cover', objectPosition: '50% 50%'} }/>
      {% endif %}
    </div>
  {% endif %}
  <div className={theme.content}>
    {{ content | raw }}
  </div>
</section>