/*
path: search.tpl
type: file
unique_id: 36m5BEAd
icon: ico-field
children: []
*/
(req, _res, next) => {
  const { before, after, filter, sort, skip, limit, page } = req.query || {}
  const options = {
    page: Number(page) || 1,
    limit: Number(limit) || 10,
    populate: []
  }

  {% for field in table.fields %}
    {% set fieldWithData = field | fieldData %}
    {% include includeTemplate(['Fields' ~ field.data_type ~ 'find.tpl', 'Fieldsfind.tpl']) %}
  {% endfor %}

  const aggregate = []

  if (skip) aggregate.push({ $skip: skip })
  if (sort) aggregate.push({ $sort: { [sort.field]: [sort.desc] ? -1 : 1 } })
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
  next()
},
async (req, res) => {
  try {
    const results = await {{ tableName }}Model.paginate({}, req.options)
    res.status(200).json({ success: true, data: results })
  } catch(error) {
    res.status(400).json({ success: false, error: error.toString() })
  }
}