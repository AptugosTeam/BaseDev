/*
path: SocialMediaEmbed.tpl
completePath: elements\Experimental\SocialMediaEmbed.tpl
keyPath: elements\Experimental\SocialMediaEmbed.tpl
unique_id: KkmDtkUx
options:
  - name: socialNetwork
    display: Social Network
    type: dropdown
    options: return [['facebook', 'Facebook'], ['instagram', 'Instagram'], ['linkedIn', 'LinkedIn'], ['pinterest','Pinterest'], ['tikTok','TikTok'], ['twitter', 'Twitter'], ['youTube', 'YouTube']]  
  - name: url
    display: Embed URL
    type: text
    options: ''
  - name: width
    display: Width
    type: text
    options: ''
settings:
  - name: Packages
    value: '"react-social-media-embed": "^2.5.17",'         
*/
{% set bpr %}
import { FacebookEmbed, InstagramEmbed, LinkedInEmbed, PinterestEmbed, TikTokEmbed, XEmbed, YouTubeEmbed } from 'react-social-media-embed';
{% endset %}
{{ save_delayed('bpr', bpr) }}
<div style={ { display: 'flex', justifyContent: 'center' } }>
  {% if element.values.socialNetwork == "facebook" %}
    <FacebookEmbed url={ "{{ element.values.url }}" } width={ {{ element.values.width|default("550") }} } />
  {% endif %}
  {% if element.values.socialNetwork == "instagram" %}
    <InstagramEmbed url={ "{{ element.values.url }}" } width={ {{ element.values.width|default("328") }} } />
  {% endif %}    
  {% if element.values.socialNetwork == "linkedIn" %}
    <LinkedInEmbed url={ "{{ element.values.url }}" } width={ {{ element.values.width|default("325") }} } />
  {% endif %}    
  {% if element.values.socialNetwork == "pinterest" %}
    <PinterestEmbed url={ "{{ element.values.url }}" } width={ {{ element.values.width|default("345") }} } />
  {% endif %}    
  {% if element.values.socialNetwork == "tikTok" %}
    <TikTokEmbed url={ "{{ element.values.url }}" } width={ {{ element.values.width|default("325") }} } />
  {% endif %}    
  {% if element.values.socialNetwork == "twitter" %}
    <XEmbed url={ "{{ element.values.url }}" } width={ {{ element.values.width|default("325") }} } />
  {% endif %}    
  {% if element.values.socialNetwork == "youTube" %}
    <YouTubeEmbed url={ "{{ element.values.url }}" } width={ {{ element.values.width|default("325") }} } />
  {% endif %}    
</div>