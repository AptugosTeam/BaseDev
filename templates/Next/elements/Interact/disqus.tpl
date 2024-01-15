/*
path: disqus.tpl
type: file
unique_id: hSVmFQvy
icon: ico-disqus
helpText: Add Disqus commenting into your website
settings:
  - name: Packages
    value: '"disqus-react": "latest",'
options:
  - name: pageUrl
    display: Page URL
    type: text
    options: ''
  - name: pageIdentifier
    display: Page Unique Identifier
    type: text
    options: ''
  - name: shortname
    display: ShortName (from Disqus)
    type: text
    options: ''
children: []
*/
{% set bpr %}
import { DiscussionEmbed } from 'disqus-react'
{% endset %}
{{ save_delayed('bpr', bpr)}}
<DiscussionEmbed
  shortname='{{ element.values.shortname }}'
  config={
    {
      url: {{ element.values.pageUrl }},
      identifier: {{ element.values.pageIdentifier }}
    }
  }
/>