/*
path: FlatList.tpl
completePath: elements/Basic/FlatList.tpl
type: file
unique_id: FL8ra7AV
icon: ico-div
sourceType: javascript
options:
  - name: Style
    display: Style
    type: text
    options: ''
  - name: data
    display: Data
    type: text
    options: ''
  - name: renderItem
    display: Render Item
    type: text
    options: ''
  - name: keyExtractor
    display: Key Extractor
    type: text
    options: ''
  - name: nestedScrollEnabled
    display: Enable nested scrolling?
    type: checkbox
    options: ''
  - name: getItemLayout
    display: Item Layout Control
    type: code
    options: ''
  - name: initialScrollIndex
    display: Initial Scroll index
    type: text
children: []
helpText: Basic HTML Div element
*/
{% set bpr %}
import { FlatList } from 'react-native'
{% endset %}
{{ save_delayed('bpr',bpr)}}
<FlatList
  {% if element.values.Style %}style={ {{element.values.Style}} }{% endif %}
  {% if element.values.nestedScrollEnabled %}nestedScrollEnabled{% endif %}
  {% if element.values.data %}data={ {{element.values.data}} }{% endif %}
  {% if element.children %}renderItem={(item) => {% for child in element.children %}{{ child.rendered | raw }}{% endfor %} }
  {% elseif element.values.renderItem %}renderItem={ {{element.values.renderItem | functionOrCall }} }{% endif %}
  {% if element.values.keyExtractor %}keyExtractor={ {{element.values.keyExtractor}} }{% endif %}
  {% if element.values.getItemLayout %}getItemLayout={(data:any, index:number) => ({{ element.values.getItemLayout }})}{% endif %}
  {% if element.values.initialScrollIndex %}initialScrollIndex={{ element.values.initialScrollIndex | textOrVariable }}{% endif %}
/>