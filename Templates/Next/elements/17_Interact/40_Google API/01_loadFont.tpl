/*
path: loadFont.tpl
keyPath: elements/Experimental/loadFont.tpl
unique_id: nX9yXneu
order: 1
icon: ico-googlefonts
name: Load Google Font
options:
  - name: font
    display: Font
    type: dropdown
    options: ['Assistant','Fira_Sans','Merriweather','Inria_Serif','Inter','Lobster','Outfit']
  - name: weight300
    display: Weight - 300
    type: checkbox
  - name: weight400
    display: Weight - 400
    type: checkbox
  - name: weight500
    display: Weight - 500
    type: checkbox
  - name: weight600
    display: Weight - 600
    type: checkbox
  - name: weight700
    display: Weight - 700
    type: checkbox
  - name: weight800
    display: Weight - 800
    type: checkbox
*/
{% set IBA %}
import { {{ element.values.font }} } from 'next/font/google'
const {{ element.values.font }}_init = {{ element.values.font }}({
  subsets: ['latin'],
  weight: [
    {% if element.values.weight300 %}'300',{% endif %}
    {% if element.values.weight400 %}'400',{% endif %}
    {% if element.values.weight500 %}'500',{% endif %}
    {% if element.values.weight600 %}'600',{% endif %}
    {% if element.values.weight700 %}'700',{% endif %}
    {% if element.values.weight800 %}'800',{% endif %}
  ]
})
{% endset %}
{{ add_setting('SiteWideBeforePageRenderAddenum', IBA) }}
{% set IBB %}
<style jsx global>{`
  :root {
    --{{ element.values.font }}: ${ {{ element.values.font }}_init.style.fontFamily }
  }
`}</style>
{% endset %}
{{ add_setting('SiteWideAddenum', IBB) }}
