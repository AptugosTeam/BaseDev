/*
path: SocialSharing.tpl
type: file
unique_id: fldZPyDc
icon: ico-social-sharing
helpText: Allows to share your current page in Social Networks
settings:
  - name: Packages
    value: '"react-social-sharing": "latest",'
options:
  - name: link
    display: Link
    type: text
    options: ''
  - name: display
    display: Display
    type: dropdown
    options: simple;simpleReverse;solidcircle;solid
  - name: size
    display: Size
    type: dropdown
    options: small;medium;big
  - name: network
    display: Network
    type: dropdown
    options: >-
      Twitter;Facebook;Google;Tumblr;Mail;Pinterest;Linkedin;Reddit;Xing;Whatsapp;HackerNews;VK;Telegram
children: []
*/
{% set bpr %}
import { {{ element.values.network }} } from 'react-social-sharing'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<{{ element.values.network }}
  link={{ element.values.link|textOrVariable }}
  {% if element.values.display %} {{ element.values.display }} {% endif %}
  {% if element.values.size %} {{ element.values.size }} {% endif %}
/>