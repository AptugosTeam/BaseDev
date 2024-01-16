/*
path: "{{ table.name |\_friendly |\_lower }}/index.tsx"
type: file
unique_id: aqp3dURo
icon: ico-field
modelRelated: true
sourceType: javascript
subtype: Aptugo
children: []
*/
{% set tableName = table.name | friendly | lower %}
{% set singleName = table.singleName | friendly | lower %}
import { ValidateProps } from "../../../api-lib/constants";
import {
  find{{ tableName }},
  count{{ tableName }},
  insert{{ singleName }},
  update{{ singleName }}ById,
  find{{ singleName }}ById,
  delete{{ singleName }}ById,
} from "../../../api-lib/db";
import { database, validateBody } from "../../../api-lib/middlewares";
import { ncOpts } from "../../../api-lib/nc"
import nc from "next-connect";

const handler = nc(ncOpts);
handler.use(database);

const ITEMS_PER_PAGE = 6;
handler.get(async (req, res) => {
  const page = req.query.page || 1;
  const skip = (page - 1) * ITEMS_PER_PAGE;
  const {{ singleName }}InfoAll = await count{{ tableName }}(
    req.db,
    req.query.before ? new Date(req.query.before) : undefined,
    req.query.by
  );
  const countPromise = {{ singleName }}InfoAll.length;
  // add skip and limit query for pagination
  const {{ singleName }}Info = await find{{ tableName }}(
    req.db,
    req.query.before ? new Date(req.query.before) : undefined,
    req.query.by,
    req.query.skip ? req.query.skip : skip,
    req.query.limit ? +req.query.limit : ITEMS_PER_PAGE
  );
  const [count, items] = await Promise.all([countPromise, {{ singleName }}Info]);
  const pageCount = Math.ceil(countPromise / ITEMS_PER_PAGE);

  return res.json({
    pagination: {
      count,
      pageCount,
    },
    {{ tableName }}: items,
  });
});

handler.post(
  (req, _res, next) => {
    {% for field in table.fields %}
      {% if field.relationshipType == 'm:1' %}
        if (typeof req.body.{{ field.column_name | friendly | lower }} === 'object') req.body.{{ field.column_name | friendly | lower }} = req.body.{{ field.column_name | friendly | lower }}._id
      {% endif %}
    {% endfor %}
    next()
  },
  validateBody({
    type: "object",
    properties: {
      ...ValidateProps.{{ singleName }},
    },
    additionalProperties: true,
  }),
  async (req, res) => {
    const {{ singleName }} = await insert{{ singleName }}(req.db, {
      {% for field in table.fields %}
        {{ field.column_name | friendly | lower }}: req.body.{{ field.column_name | friendly | lower }},
      {% endfor %}
    });
    return res.json({ {{ singleName }} });
  }
);

handler.patch(
  (req, _res, next) => {
    {% for field in table.fields %}
      {% if field.relationshipType == 'm:1' %}
        if (typeof req.body.{{ field.column_name | friendly | lower }} === 'object') req.body.{{ field.column_name | friendly | lower }} = req.body.{{ field.column_name | friendly | lower }}._id
      {% endif %}
    {% endfor %}
    next()
  },
  validateBody({
    type: "object",
    properties: {
      {% for field in table.fields %}
      {{ field.column_name | friendly | lower }}: ValidateProps.{{ singleName}}.{{ field.column_name | friendly | lower }},
      {% endfor %}
    },
  }),
  async (req, res) => {
    const {
      _id, 
      {% for field in table.fields %}
        {{ field.column_name | friendly | lower }},
      {% endfor %}
    } = req.body;
    const {{ tableName }} = await update{{ singleName }}ById(req.db, _id, {
      {% for field in table.fields %}
        {{ field.column_name | friendly | lower }},
      {% endfor %}
    });

    res.json({ {{ tableName }} });
  }
);

handler.delete(async (req, res) => {
  const { _id } = req.body
  const {{ singleName }} = await delete{{ singleName }}ById(req.db, _id)
  res.json({ {{ singleName }} })
});

export default handler;
