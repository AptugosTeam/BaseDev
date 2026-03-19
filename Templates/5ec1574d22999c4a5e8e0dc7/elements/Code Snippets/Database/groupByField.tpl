/*
path: groupByField.json
completePath: >-
  /Users/gaston/Aptugo/templates/5ec1574d22999c4a5e8e0dc7/elements/Aptugo
  Internal Use/Code Snippets/Database/groupByField.json
keyPath: elements/Aptugo Internal Use/Code Snippets/Database/groupByField.json
unique_id: Jxrrr97dD
name: js_groupbyfield
fullload: true
*/
{
  "type": "data_aggregate",
  "message0": "%2 Group by field %1",
  "args0": [
    {
      "type": "input_dummy",
      "name": "SELECTEDFIELD"
    },
    {
      "type": "field_image",
      "src": "media/js.svg",
      "width": 16,
      "height": 16
    }
  ],
  "message1": "Then %1",
  "args1": [
    {
      "type": "input_statement",
      "name": "THEN"
    }
  ],
  "previousStatement": null,
  "tooltip": "Groups database results by field",
  "extensions": ["get_fields_list"]
}