/*
path: search.tpl
type: file
unique_id: 36m5BEAd
icon: ico-field
children: []
*/
(req, _res, next) => {
  const { before, after, filter, sortField, sortMethod, skip, limit, page, populate, fields } = req.query || {}
  const options = {
    page: Number(page) || 1,
    limit: Number(limit) || 10,
    populate: [],
    projection: {}
  }

  const aggregate = []

  if (populate && populate === 'true') {
    {% for field in table.fields %}
      {% set fieldWithData = field | fieldData %}
      {% include includeTemplate(['Fields' ~ field.data_type ~ 'find.tpl', 'Fieldsfind.tpl']) %}
    {% endfor %}
  }

  if (fields) {
    const parsedFields = JSON.parse(decodeURIComponent(fields))
    options.projection = parsedFields 
  }

  
  if (filter) {
    if (typeof filter === 'string') {
      aggregate.push(
        {
          $match: {
            $or: [
              {% for field in table.fields %}
                { {{ field.column_name | friendly }}: { $regex: filter, $options: "i"} },
              {% endfor %}
            ]
          }
        }
      )
    } else {
      const parsedFilter = JSON.parse(decodeURIComponent(filter))
      Object.assign(aggregate, parsedFilter)
    }
  }

  req.aggregate = aggregate
  req.options = options
  next()
},
async (req, res) => {
  try {
    const results = await {{ tableName }}Model.aggregatePaginate(req.aggregate, req.options)
    res.status(200).json({ success: true, data: results })
  } catch(error) {
    res.status(400).json({ success: false, error: error.toString() })
  }
}