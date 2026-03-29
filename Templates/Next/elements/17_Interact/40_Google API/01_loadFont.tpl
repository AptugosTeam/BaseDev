/*
path: loadFont.tpl
keyPath: elements/Experimental/loadFont.tpl
unique_id: nX9yXneu
order: 1
icon: ico-googlefonts
name: Load Google Font
helpText: Loads a Google Font through next/font/google and exposes it as a global CSS variable and helper class.
options:
  - name: font
    display: Font
    type: dropdown
    options: ['Assistant','Fira_Sans','IBM_Plex_Sans','Merriweather','Inria_Serif','Inter','Lobster','Outfit','Lato','Montserrat','Red_Hat_Display','Roboto','Oswald']
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
{% set selectedFont = element.values.font|default('Inter') %}
{% set fontSlug = selectedFont|replace({'_':'-'})|lower %}
{% set fontVarName = 'font_' ~ element.unique_id %}

{% set weights = [] %}
{% if element.values.weight300 %}{% set weights = weights|merge(['300']) %}{% endif %}
{% if element.values.weight400 %}{% set weights = weights|merge(['400']) %}{% endif %}
{% if element.values.weight500 %}{% set weights = weights|merge(['500']) %}{% endif %}
{% if element.values.weight600 %}{% set weights = weights|merge(['600']) %}{% endif %}
{% if element.values.weight700 %}{% set weights = weights|merge(['700']) %}{% endif %}
{% if element.values.weight800 %}{% set weights = weights|merge(['800']) %}{% endif %}

{% if weights|length == 0 %}
  {% set weights = ['400'] %}
{% endif %}

{% set IBA %}
import { {{ selectedFont }} } from 'next/font/google'

const {{ fontVarName }} = {{ selectedFont }}({
  subsets: ['latin'],
  weight: {{ weights|json_encode|raw }},
  display: 'swap'
})
{% endset %}
{{ add_setting('SiteWideBeforePageRenderAddenum', IBA) }}

{% set IBB %}
<style jsx global>{`
  :root {
    --font-{{ fontSlug }}: ${ {{ fontVarName }}.style.fontFamily };
  }

  .font-{{ fontSlug }} {
    font-family: var(--font-{{ fontSlug }});
  }
`}</style>
{% endset %}
{{ add_setting('SiteWideAddenum', IBB) }}