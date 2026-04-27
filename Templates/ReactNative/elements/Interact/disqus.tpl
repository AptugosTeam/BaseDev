/*
path: disqus.tpl
type: file
unique_id: hSVmFQvy
icon: ico-disqus
helpText: Embed a Disqus discussion thread inside the app for a specific page URL and identifier
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
