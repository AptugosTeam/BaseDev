/*
path: SocialMediaEmbed.tpl
completePath: elements\Experimental\SocialMediaEmbed.tpl
keyPath: elements\Experimental\SocialMediaEmbed.tpl
unique_id: KkmDtkUx
icon: ico-social-sharing
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
    {% if "http" in element.values.url %}
      <FacebookEmbed url={ "{{ element.values.url }}" } width={ {{ element.values.width|default("550") }} } />
    {% else %}
      <FacebookEmbed url= {{ element.values.url }} width={ {{ element.values.width|default("550") }} } /> 
    {% endif %}
  {% endif %}
  {% if element.values.socialNetwork == "instagram" %}
    {% if "http" in element.values.url %}
        <InstagramEmbed url={ "{{ element.values.url }}" } width={ {{ element.values.width|default("328") }} } />
    {% else %}
        <InstagramEmbed url= {{ element.values.url }} width={ {{ element.values.width|default("328") }} }/>
    {% endif %}
  {% endif %} 
  {% if element.values.socialNetwork == "linkedIn" %}
    {% if "http" in element.values.url %}
        <LinkedInEmbed url={ "{{ element.values.url }}" } width={ {{ element.values.width|default("328") }} } />
    {% else %}
        <LinkedInEmbed url= {{ element.values.url }} width={ {{ element.values.width|default("328") }} }/>
    {% endif %}
  {% endif %}   
  {% if element.values.socialNetwork == "pinterest" %}
    {% if "http" in element.values.url %}
        <PinterestEmbed url={ "{{ element.values.url }}" } width={ {{ element.values.width|default("328") }} } />
    {% else %}
        <PinterestEmbed url= {{ element.values.url }} width={ {{ element.values.width|default("328") }} }/>
    {% endif %}
  {% endif %}   
  {% if element.values.socialNetwork == "tikTok" %}
    {% if "http" in element.values.url %}
        <TikTokEmbed url={ "{{ element.values.url }}" } width={ {{ element.values.width|default("328") }} } />
    {% else %}
        <TikTokEmbed url= {{ element.values.url }} width={ {{ element.values.width|default("328") }} }/>
    {% endif %}
  {% endif %}   
  {% if element.values.socialNetwork == "twitter" %}
    {% if "http" in element.values.url %}
        <XEmbed url={ "{{ element.values.url }}" } width={ {{ element.values.width|default("328") }} } />
    {% else %}
        <XEmbed url= {{ element.values.url }} width={ {{ element.values.width|default("328") }} }/>
    {% endif %}
  {% endif %}   
  {% if element.values.socialNetwork == "youTube" %}
    {% if "http" in element.values.url %}
        <YouTubeEmbed url={ "{{ element.values.url }}" } width={ {{ element.values.width|default("328") }} } />
    {% else %}
        <YouTubeEmbed url= {{ element.values.url }} width={ {{ element.values.width|default("328") }} }/>
    {% endif %}
  {% endif %}    
</div>