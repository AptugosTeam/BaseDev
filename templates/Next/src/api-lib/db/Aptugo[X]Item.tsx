/*
path: "{{ table.name |\_friendly |\_lower }}.tsx"
type: file
unique_id: gSp3dULo
icon: ico-field
modelRelated: true
sourceType: javascript
subtype: Aptugo
children: []
*/
{{ insert_setting('modelAddenumHead') | raw }}
{% set tableName = table.name | friendly | lower %}
{% set singleName = table.singleName | friendly | lower %}
import { ObjectId } from "mongodb"

{% for field in table.fields %}
  {% set fieldWithData = field | fieldData %}
  {% include includeTemplate(['Fields' ~ field.data_type ~'updateImports.tpl', 'FieldsupdateImports.tpl']) %}
{% endfor %}

const buildAggregation = (query) => {
  const { before, after, filter, sort, skip, limit } = query || {}
  const aggregate = []

  if (skip) aggregate.push({ $skip: skip })
  if (limit) aggregate.push({ $limit: Number(limit) })
  if (sort) aggregate.push({ $sort: { [sort.field]: [sort.desc] ? -1 : 1 } })
  if (before) aggregate.push({ $match: { ...(before && { createdAt: { $lt: before } }) } })
  if (after) aggregate.push({ $match: { ...(after && { createdAt: { $gt: after } }) } })
  if (filter) {
    for (var filt of Object.keys(filter)) {
      aggregate.push({
        $match: { [filt]: filter[filt]}
      })
    }
  }
  return aggregate
}

export async function find{{ singleName }}ById(db, _id) {
  const {{ tableName }} = await db
    .collection("{{ tableName }}")
    .aggregate([
      { $match: { _id: new ObjectId(_id) } },
      { $limit: 1 },
    ])
    .toArray();

  if (!{{ tableName }}[0]) return null;
  return {{ tableName }}[0];
}

export async function find{{ tableName }}(db, query) {
  return db
  .collection('{{ tableName }}')
  .aggregate(buildAggregation(query))
  .toArray()
}

export function count{{tableName }}(db, query) {
  const queryWithoutLimit = { ...query }
  delete queryWithoutLimit.limit
  return db
    .collection("{{ tableName }}")
    .aggregate(buildAggregation(queryWithoutLimit))
    .toArray();
}

export async function insert{{ singleName }}( db, fields) {
  const {{ singleName }}:any = {
    createdAt: new Date()
  }
  
  {% for field in table.fields %}
    {% set fieldWithData = field | fieldData %}
    {% include includeTemplate(['Fields' ~ field.data_type ~'update.tpl', 'Fieldsupdate.tpl']) %}
  {% endfor %}

  const { insertedId } = await db
    .collection("{{ tableName }}")
    .insertOne({{ singleName }});
  {{ singleName }}._id = insertedId;
  return {{ singleName }};
}

export async function update{{ singleName }}ById(db, _id, fields) {
  const {{ singleName }}:any = {
    createdAt: new Date()
  }
  
  {% for field in table.fields %}
    {% set fieldWithData = field | fieldData %}
    {% include includeTemplate(['Fields' ~ field.data_type ~'update.tpl', 'Fieldsupdate.tpl']) %}
  {% endfor %}

  return db
    .collection("{{ tableName }}")
    .findOneAndUpdate({ _id: new ObjectId(_id) }, { $set: {{ singleName }} })
    .then((value) => console.log("Value: " + value))
    .catch((err) => {
      console.log("Error: " + err);
    });
}

export async function delete{{ singleName }}ById(db, _id) {
  return db
    .collection("{{ tableName }}")
    .deleteOne({ _id: new ObjectId(_id) })
    .then((value) => console.log("Value: " + value))
    .catch((err) => {
      console.log("Error: " + err);
    });
}

{{ insert_setting('modelAddenum') | raw }}