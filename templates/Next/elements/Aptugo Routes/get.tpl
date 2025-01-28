/*
path: get.tpl
completePath: elements/Aptugo Routes/get.tpl
unique_id: AlPg3QRE
*/
(req, _res, next) => {
  const { before, after, filter, sortField, sortMethod, skip, limit, page } = req.query || {}
  const options = {
    page: Number(page) || 1,
    limit: Number(limit) || 10,
    populate: []
  }

  const aggregate = []
  
  {% for field in table.fields %}
    {% set fieldWithData = field | fieldData %}
    {% include includeTemplate(['Fields' ~ field.data_type ~ 'find.tpl', 'Fieldsfind.tpl']) %}
  {% endfor %}

  if (skip) aggregate.push({ $skip: skip })
  if (sortField && sortMethod) aggregate.push({ $sort: { [sortField]: sortMethod === 'desc' ? -1 : 1 } })
  if (before) aggregate.push({ $match: { ...(before && { createdAt: { $lt: before } }) } })
  if (after) aggregate.push({ $match: { ...(after && { createdAt: { $gt: after } }) } })
  if (filter) {
    for (var filt of Object.keys(filter)) {
      aggregate.push({
        $match: { [filt]: filter[filt] },
      })
    }
  }
  req.options = options
  req.aggregate = aggregate
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