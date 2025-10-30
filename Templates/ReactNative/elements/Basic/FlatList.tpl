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
  - name: contentContainerStyle
    display: Content Container Styles
    type: text
    options: ''
  - name: data
    display: Data
    type: text
    options: ''
  - name: renderItem
    display: Render Item
    type: code
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
  - name: renderItemCode
    display: Render Item Code
    type: code
    options: ''
  - name: initialScrollIndex
    display: Initial Scroll index
    type: text
  - name: parameter
    display: Parameter to Render Item
    type: text
  - name: horizontal
    display: Is horizontal?
    type: checkbox
    options: ''  
  - name: showsHorizontalScrollIndicator
    display: Disabled horizontal scroll indicators?
    type: checkbox
  - name: pagingEnabled
    display: Enable paging?
    type: checkbox
    options: ''
  - name: onViewableItemsChanged
    display: On Viewable Items Changed
    type: code
    options: ''
  - name: viewabilityConfig
    display: Viewability Config
    type: code
    options: ''
  - name: columns
    display: Number of Columns
    type: text
    options: ''
  - name: columnWrapperStyle
    display: Column Wrapper Style
    type: text
    options: ''
  - name: onEndReached
    display: On End Reached
    type: code
    options: ''
    advanced: true
  - name: onEndReachedThreshold
    display: On End Reached Threshold
    type: text
    options: ''
    advanced: true
children: []
helpText: Displays a scrollable list of data.
*/
{% set bpr %}
import { FlatList } from 'react-native'
{% endset %}
{{ save_delayed('bpr',bpr)}}
<FlatList
  {% if element.values.Style %}style={ {{element.values.Style}} }{% endif %}
  {% if element.values.contentContainerStyle %}contentContainerStyle={ {{element.values.contentContainerStyle}} }{% endif %}
  {% if element.values.nestedScrollEnabled %}nestedScrollEnabled{% endif %}
  {% if element.values.horizontal %}horizontal{% endif %}
  {% if element.values.columns %}numColumns={ {{element.values.columns}} }{% endif %}
  {% if element.values.columnWrapperStyle %}columnWrapperStyle={ {{element.values.columnWrapperStyle}} }{% endif %}
  {% if element.values.data %}data={ {{element.values.data}} }{% endif %}
  {% if element.values.showsHorizontalScrollIndicator %}showsHorizontalScrollIndicator={false} {% endif %}
  {% if element.values.pagingEnabled %}pagingEnabled{% endif %}
  {% if element.values.onViewableItemsChanged %}onViewableItemsChanged={ {{element.values.onViewableItemsChanged | functionOrCall }} }{% endif %}
  {% if element.values.viewabilityConfig %}viewabilityConfig={ {{element.values.viewabilityConfig}} }{% endif %}
  {% if element.children %}renderItem={({{element.values.parameter | default('item')}}) => {
    {% if element.values.renderItemCode %}
      {{ element.values.renderItemCode | raw }}
    {% endif %}
    return (
    {% for child in element.children %}
      {{ child.rendered | raw }}
    {% endfor %}
    )
  }}
  {% elseif element.values.renderItem %}renderItem={ {{element.values.renderItem | functionOrCall }} }{% endif %}
  {% if element.values.keyExtractor %}keyExtractor={ {{element.values.keyExtractor}} }{% endif %}
  {% if element.values.getItemLayout %}getItemLayout={(data:any, index:number) => ({{ element.values.getItemLayout }})}{% endif %}
  {% if element.values.initialScrollIndex %}initialScrollIndex={{ element.values.initialScrollIndex | textOrVariable }}{% endif %}
  {% if element.values.onEndReached %}onEndReached={ {{element.values.onEndReached | functionOrCall }} }{% endif %}
  {% if element.values.onEndReachedThreshold %}onEndReachedThreshold={ {{element.values.onEndReachedThreshold}} }{% endif %}
/>
