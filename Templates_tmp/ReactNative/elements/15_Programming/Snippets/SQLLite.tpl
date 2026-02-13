/*
path: SQLLite.tpl
keyPath: elements/15_Programming/Snippets/SQLLite.tpl
unique_id: cAwqZd76
settings:
  - name: Packages
    value: '"expo-sqlite": "~16.0.9",'
*/
{% set AppJsonPlugins %}
[
  "expo-sqlite",
  {
    "enableFTS": true,
    "useSQLCipher": true,
  }
],
{% endset %}
{{ add_setting('AppJsonPlugins', AppJsonPlugins)}}
{% set bpr %}
import * as SQLite from 'expo-sqlite'
{% endset %}
{{ save_delayed('bpr',bpr)}}