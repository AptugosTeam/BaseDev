/*
path: search.tpl
type: file
unique_id: 36m5BEAd
icon: ico-field
children: []
*/
(req, _res, next) => {
  const { before, after, filter, sort, skip, limit, page, populate, fields } = req.query || {}
  const options = {
    page: Number(page) || 1,
    limit: Number(limit) || 10,
    populate: [],
    projection: {}
  }

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

  const queryFilter = {}
  if (filter) {
    const parsedFilter = JSON.parse(decodeURIComponent(filter))
    Object.assign(queryFilter, parsedFilter)
  }

  req.queryFilter = queryFilter
  req.options = options
  next()
},
async (req, res) => {
  try {
    const results = await {{ tableName }}Model.paginate(req.queryFilter, req.options)
    res.status(200).json({ success: true, data: results })
  } catch(error) {
    res.status(400).json({ success: false, error: error.toString() })
  }
}