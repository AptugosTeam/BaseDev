/*
path: loadFont.tpl
keyPath: elements/Experimental/loadFont.tpl
unique_id: nX9yXneu
options:
  - name: font
    display: Font
    type: dropdown
    options: ['Fira_Sans','Merriweather']
*/
{% set IBA %}
import { {{ element.values.font }} } from 'next/font/google'
const {{ element.values.font }}_init = {{ element.values.font }}({
  subsets: ['latin'],
  weight: ['300','400','700']
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
