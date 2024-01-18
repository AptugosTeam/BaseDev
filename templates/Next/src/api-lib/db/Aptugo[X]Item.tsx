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
{% set tableName = table.name | friendly | lower %}
{% set singleName = table.singleName | friendly | lower %}
import { ObjectId } from "mongodb"

export async function find{{ singleName }}ById(db, _id) {
  const {{ tableName }} = await db
    .collection("{{ tableName }}")
    .aggregate([
      { $match: { _id: new ObjectId(_id) } },
      { $limit: 1 },
    ])
    .toArray();

  if (!{{ tableName }}[0]) return null;
  return {{ tableName }}[0];
}

export async function find{{ tableName }}(db, before, by, skip, limit) {
  return db
  .collection('{{ tableName }}')
  .aggregate([
    {
      $match: {
        ...(before && { createdAt: { $lt: before } }),
      },
    },
    { $sort: { _id: -1 } },
    { $skip: skip },
    { $limit: limit },
    {% for field in table.fields %}
      {% set fieldWithData = field|fieldData %}
      {% if fieldWithData.data_type == 'Autocomplete' %}
        {% set reference = field.reference | fieldData %}
        {% if field.relationshipType == 'm:1' %}
          {
            $lookup: {
              from: '{{ reference.table.name | friendly | lower }}',
              localField: '{{ field.column_name | friendly | lower }}',
              foreignField: '_id',
              as: '{{ field.column_name | friendly | lower }}',
            },
          },
          { $unwind: { 'path': '${{ field.column_name | friendly | lower }}', "preserveNullAndEmptyArrays": true }},
        {% endif %}
      {% endif %}
    {% endfor %}
  ])
  .toArray()
}

export function count{{tableName }}(db, before, by) {
  return db
    .collection("{{ tableName }}")
    .aggregate([
      {
        $match: {
          ...(by && { creatorId: new ObjectId(by) }),
          ...(before && { createdAt: { $lt: before } }),
        },
      },
    ])
    .toArray();
}

export async function insert{{ singleName }}(
  db,
  {
    {% for field in table.fields %}
      {{ field.column_name | friendly | lower }},
    {% endfor %}
  }
) {
  const {{ singleName }}:any = {
    {% for field in table.fields %}
      {% if field.data_type == 'Autocomplete' %}
        {{ field.column_name | friendly | lower }}: new ObjectId({{ field.column_name | friendly | lower }}),
      {% else %}
        {{ field.column_name | friendly | lower }},
      {% endif %}
    {% endfor %}
    createdAt: new Date(),
  };
  const { insertedId } = await db
    .collection("{{ tableName }}")
    .insertOne({{ singleName }});
  {{ singleName }}._id = insertedId;
  return {{ singleName }};
}

export async function update{{ singleName }}ById(db, _id, fields) {
  const {{ singleName }} = {
    ...fields,
    createdAt: new Date(),
  };

  return db
    .collection("{{ tableName }}")
    .findOneAndUpdate({ _id: new ObjectId(_id) }, { $set: {{ singleName }} })
    .then((value) => console.log("Value: " + value))
    .catch((err) => {
      console.log("Error: " + err);
    });
}

export async function delete{{ singleName }}ById(db, _id) {
  return db
    .collection("{{ tableName }}")
    .deleteOne({ _id: new ObjectId(_id) })
    .then((value) => console.log("Value: " + value))
    .catch((err) => {
      console.log("Error: " + err);
    });
}
