/*
path: get.tpl
completePath: elements/Aptugo Routes/get.tpl
unique_id: AlPg3QRE
*/
(req, _res, next) => {
  const { before, after, filter, sortField, sortMethod, skip, limit, page, populate } = req.query || {}
  const options = {
    page: Number(page) || 1,
    limit: Number(limit) || 10,
    populate: []
  }

  const aggregate = []
  
  {% set inaggregation = false %}
  if (populate !== 'false') {
    {% for field in table.fields %}
      {% set fieldWithData = field | fieldData %}
      {% include includeTemplate(['Fields' ~ field.data_type ~ 'find.tpl', 'Fieldsfind.tpl']) %}
    {% endfor %}
  }

  if (skip) aggregate.push({ $skip: skip })
  if (sortField && sortMethod) aggregate.push({ $sort: { [sortField]: sortMethod === 'desc' ? -1 : 1 } })
  if (before) aggregate.push({ $match: { ...(before && { createdAt: { $lt: before } }) } })
  if (after) aggregate.push({ $match: { ...(after && { createdAt: { $gt: after } }) } })
  if (filter) {
    const parsedFilter = typeof filter === 'string' ? JSON.parse(filter) : filter

    for (const filt of Object.keys(parsedFilter)) {
      let filterValue = parsedFilter[filt]

      const path = {{ tableName }}Model.schema.path(filt as any)
      if (
        path?.instance === 'ObjectId' || // direct ObjectId
        (path?.instance === 'Array' && path?.caster?.instance === 'ObjectId') // array of ObjectIds
      ) {
        filterValue = new mongoose.Types.ObjectId(filterValue);
      }
  
      if (Array.isArray(filterValue) && filterValue.length === 2) {
        let lowerBound = Number(filterValue[0])
        let upperBound = Number(filterValue[1])
  
        const filter:any = {}
        if (lowerBound) filter.$gte = lowerBound
        if (upperBound) filter.$lte = upperBound
  
        if (lowerBound || upperBound) {
          aggregate.push({
            $match: {
              [filt]: filter,
            },
          });
        }
      } else {
        aggregate.push({
          $match: { [filt]: filterValue },
        });
      }
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