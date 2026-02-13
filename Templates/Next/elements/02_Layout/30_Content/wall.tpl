/*
path: wall.tpl
icon: ico-scroll-text
keyPath: elements/02_Layout/30_Content/wall.tpl
unique_id: MJbd3pwn
options:
  - name: table
    display: Table
    type: dropdown
    options: >-
      return [['useVar','Use a
      variable'],...aptugo.store.getState().application.tables.map(({ unique_id,name }) => [unique_id, name])]
  - name: title
    display: Title
    type: dropdown
    options: >-
      return [['useVar','Use avariable'], ...aptugo.tableUtils.getAllFields()]
  - name: picture
    display: Picture
    type: dropdown
    options: >-
      return [['useVar','Use avariable'], ...aptugo.tableUtils.getAllFields()]
  - name: content
    display: Content
    type: dropdown
    options: >-
      return [['useVar','Use avariable'], ...aptugo.tableUtils.getAllFields()]
  - name: showOwner
    display: Show Owner
    type: checkbox
  - name: ownerPicture
    display: Owner Picture
    type: dropdown
    options: >-
      return [['useVar','Use avariable'], ...aptugo.tableUtils.getAllFields()]
    settings:
      condition: true
      propertyCondition: showOwner
  - name: ownerName
    display: Owner Name
    type: dropdown
    options: >-
      return [['useVar','Use avariable'], ...aptugo.tableUtils.getAllFields()]
    settings:
      condition: true
      propertyCondition: showOwner
*/
{% set mainTable = element.values.table %}
{% set eleWithoutChilds = element %}
{% set eleWithoutChilds = eleWithoutChilds|merge({'children': null, 'name':'wallData'}) %}
{% include includeTemplate('loadFromRedux.tpl') with {
  'data': mainTable,
  'element': eleWithoutChilds|merge({ values: eleWithoutChilds.values|merge({'variableName': 'wallData'}) }),
} %}
{% if not element.children %}
  {% set content %}
    {% set profilePicturePath = fillPathTo(element.values.ownerPicture|fieldData, mainTable) %}
    {% set ownerNamePath = fillPathTo(element.values.ownerName|fieldData, mainTable) %}
    <div className={theme.wallItem}>
      {% if element.values.showOwner %}
        <div className={theme.wallOwnerContainer}>
          <div className={theme.wallOwnerPicture}>{% include includeTemplate('field.tpl') with { element: { values: { Type: 'raw' }}, 'pre': 'item.' ~ profilePicturePath, 'field': element.values.ownerPicture|fieldData } %}</div>
          <div className={theme.wallOwnerDetails}>
            <div>{% include includeTemplate('field.tpl') with { element: { values: { Type: 'raw' }}, 'pre': 'item.' ~ ownerNamePath, 'field': element.values.ownerName|fieldData } %}</div>
            <div className={theme.wallTitleContainer}>{% include includeTemplate('field.tpl') with { element: { values: { Type: 'raw' }}, 'pre': 'item.', 'field': element.values.title|fieldData } %}</div>
          </div>
        </div>
      {% else %}
        <div className={theme.wallTitleContainer}>{% include includeTemplate('field.tpl') with { element: { values: { Type: 'raw' }}, 'pre': 'item.', 'field': element.values.title|fieldData } %}</div>
      {% endif %}
      <div className={theme.wallImageContainer}>{% include includeTemplate('field.tpl') with { element: { values: { Type: 'raw' }}, 'pre': 'item.', 'field': element.values.picture|fieldData } %}</div>
      <div className={theme.wallContentContainer}>{% include includeTemplate('field.tpl') with { element: { values: { Type: 'raw' }}, 'pre': 'item.', 'field': element.values.content|fieldData } %}</div>
    </div>
  {% endset %}
{% endif %}
<div className={theme.wall}>
{% include includeTemplate('loop.tpl') with {
  content: content, 
  element: {
    values: {
      variable: 'wallData?.data?.docs'
    }
  }
} %}
</div>