/*
path: text.tpl
type: file
unique_id: gBDZLTD1
icon: ico-text
helpText: >-
  Insert simple text anywhere. Can hold variables, code, and anything of your
  choice
sourceType: javascript
options:
  - name: Content
    display: Content
    type: text
    options: ''
  - name: className
    display: ClassName
    type: text
    options: ''
  - name: lines
    display: Display lines
    type: text
  - name: expandable
    display: Expandable
    type: checkbox
  - name: adjustsFontSizeToFit
    display: Adjust Font Size to Fit
    type: checkbox
  - name: onPress
    display: On Press
    type: text
    options: ''
    advanced: true
children: []
*/
{% set bpr %}
import { Text } from 'react-native'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% if element.values.expandable %}
{% set tag = 'MoreLessText' %}
{% set bpr %}
export function MoreLessText({ children, numberOfLines }) {
  const [isTruncatedText, setIsTruncatedText] = React.useState(false)
  const [showMore, setShowMore] = React.useState(true)

  return isTruncatedText ? (
    <>
      <Text numberOfLines={showMore ? numberOfLines : 0}>{children}</Text>
      <Text onPress={() => setShowMore(!showMore)}>
        {showMore ? 'Read More' : 'Hide'}
      </Text>
    </>
  ) : (
    <Text
      onTextLayout={(event) => {
        const { lines } = event.nativeEvent
        setIsTruncatedText(lines?.length > numberOfLines)
      }}
    >
      {children}
    </Text>
  )
}
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% else %}
{% set tag = 'Text' %}
{% endif %}
<{{ tag }}
  {% if element.values.className %}style={ {{ element.values.className }} }{% endif %}
  {% if element.values.lines %}numberOfLines={ {{ element.values.lines }} }{% endif %}
  {% if element.values.adjustsFontSizeToFit %}adjustsFontSizeToFit{% endif %}
  {% if element.values.onPress %}onPress={ {{ element.values.onPress }} }{% endif %}
>{{ element.values.Content | raw }}{{ content | raw }}</{{ tag }}>