/*
path: bringData.json
completePath: >-
  /Users/gaston/Aptugo/templates/5ec1574d22999c4a5e8e0dc7/elements/Aptugo
  Internal Use/Code Snippets/Database/bringData.json
keyPath: elements/Aptugo Internal Use/Code Snippets/Database/bringData.json
unique_id: Jxsss97dD
name: js_bringData
fullload: true
*/
{
  "type": "load_data",
  "message0": "%2 Load data from %1",
  "args0": [
    {
      "type": "input_dummy",
      "name": "MODEL"
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
  "tooltip": "Loads data from the database",
  "extensions": ["get_tables_list"]
}