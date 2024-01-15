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
      // {
      //   $lookup: {
      //     from: 'partners',
      //     localField: 'creatorId',
      //     foreignField: '_id',
      //     as: 'creator',
      //   },
      // },
      // { $unwind: '$creator' },
      // { $project: dbProjectionUsers('creator.') },
    ])
    .toArray();

  if (!{{ tableName }}[0]) return null;
  return {{ tableName }}[0];
}

export async function find{{ singleName }}s(db, before, by, skip, limit) {
  return db
    .collection("{{ tableName }}")
    .aggregate([
      {
        $match: {
          ...(by && { creatorId: new ObjectId(by) }),
          ...(before && { createdAt: { $lt: before } }),
        },
      },
      { $sort: { _id: -1 } },
      { $skip: skip },
      { $limit: limit },
      // {
      //   $lookup: {
      //     from: 'users',
      //     localField: 'creatorId',
      //     foreignField: '_id',
      //     as: 'creator',
      // },
      // },
      // { $unwind: '$creator' },
      // { $project: dbProjectionUsers('creator.') },
    ])
    .toArray();
}

export function count{{ singleName }}s(db, before, by) {
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
  const {{ singleName }} = {
    {% for field in table.fields %}
      {{ field.column_name | friendly | lower }},
    {% endfor %}
    createdAt: new Date(),
  };
  const { insertedId } = await db
    .collection("{{ tableName }}")
    .insertOne({{ singleName }});
  {{ singleName }}._id = insertedId;
  return {{ singleName }};
}

export async function update{{ singleName }}ById(
  db,
  _id,
  {
    {% for field in table.fields %}
      {{ field.column_name | friendly | lower }},
    {% endfor %}
  }
) {
  const {{ singleName }} = {
    {% for field in table.fields %}
      {{ field.column_name | friendly | lower }},
    {% endfor %}
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
