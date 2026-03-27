/*
path: GeoLocation.tpl
completePath: elements/Geo/GeoLocation.tpl
type: file
unique_id: d1Jx8mQa
icon: ico-geolocalization
sourceType: javascript
helpText: Imports expo-location and can optionally call a Location method and store its result
options:
  - name: method
    display: Location Method
    type: text
    options: ''
  - name: parameters
    display: Parameters
    type: code
    options: ''
  - name: storeMode
    display: Store Result
    type: dropdown
    options: none;variable;custom
    settings:
      default: none
  - name: variableStoreType
    display: Variable Type
    type: dropdown
    options: const;let;existing let
    settings:
      propertyCondition: storeMode
      condition: variable
  - name: variableStoreName
    display: Variable Name
    type: text
    options: ''
    settings:
      propertyCondition: storeMode
      condition: variable
  - name: resultVariable
    display: Result Alias
    type: text
    options: ''
    settings:
      propertyCondition: storeMode
      condition: custom
  - name: customStoreCode
    display: Custom Store Code
    type: code
    options: ''
    settings:
      propertyCondition: storeMode
      condition: custom
  - name: includePlugin
    display: Add App.json Plugin
    type: checkbox
    advanced: true
    settings:
      default: true
  - name: permissionMessage
    display: When In Use Permission
    type: text
    options: ''
    advanced: true
    settings:
      propertyCondition: includePlugin
      condition: true
  - name: enableBackgroundLocation
    display: Enable Background Location
    type: checkbox
    advanced: true
    settings:
      propertyCondition: includePlugin
      condition: true
  - name: alwaysPermissionMessage
    display: Always Permission
    type: text
    options: ''
    advanced: true
    settings:
      propertyCondition: enableBackgroundLocation
      condition: true
children: []
settings:
  - name: Packages
    value: '"expo-location": "~19.0.8",'
*/
{% if element.values.includePlugin %}
{% set AppJsonPlugins %}[
  "expo-location",
  {
    "locationWhenInUsePermission": "{{ element.values.permissionMessage|default('Allow this app to access your location.') }}"
    {% if element.values.enableBackgroundLocation %},
    "locationAlwaysAndWhenInUsePermission": "{{ element.values.alwaysPermissionMessage|default('Allow this app to access your location in the background.') }}",
    "isAndroidBackgroundLocationEnabled": true,
    {% endif %}
  }
],{% endset %}
{{ add_setting('AppJsonPlugins', AppJsonPlugins)}}

{% if element.values.enableBackgroundLocation %}
{% set infoPlist %}
  "NSLocationAlwaysAndWhenInUseUsageDescription": "{{ element.values.alwaysPermissionMessage|default('Allow this app to access your location in the background.') }}",
  "NSLocationAlwaysUsageDescription": "{{ element.values.alwaysPermissionMessage|default('Allow this app to access your location in the background.') }}",
  "UIBackgroundModes": ["location"],
{% endset %}
{{ add_setting('infoPlist', infoPlist)}}
{% endif %}
{% endif %}


{% set bpr %}
import * as Location from 'expo-location'
{% endset %}
{{ save_delayed('bpr',bpr)}}

{% if element.values.method %}
{% set parameters = element.values.parameters %}
{% set resultVariable = element.values.resultVariable|default(element.values.variableStoreName|default('locationResult')) %}
{% set callExpression %}await Location.{{ element.values.method }}({{ parameters }}){% endset %}

{% if element.values.storeMode == 'variable' %}
  {% if element.values.variableStoreType|default('const') == 'existing let' %}
{{ element.values.variableStoreName|default('locationResult') }} = {{ callExpression }}
  {% else %}
{{ element.values.variableStoreType|default('const') }} {{ element.values.variableStoreName|default('locationResult') }} = {{ callExpression }}
  {% endif %}
{% elseif element.values.storeMode|default('none') == 'custom' %}
const {{ resultVariable }} = {{ callExpression }}
{{ element.values.customStoreCode | raw }}
{% else %}
{{ callExpression }}
{% endif %}
{% endif %}
