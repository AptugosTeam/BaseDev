/*
path: raw.tpl
keyPath: elements/Fields/Image/raw.tpl
unique_id: IkOemesy
*/
{% include includeTemplate('image.tpl') with {
  element: { 
    values: {
      'path': '{' ~ pre ~ (field.column_name | friendly) ~ '}',
    }
  }
} %}