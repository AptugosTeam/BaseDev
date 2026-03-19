/*
path: search.tpl
type: file
unique_id: 36m5BEAd
icon: ico-field
children: []
*/
async (req, res) => {
  const { page, limit, ...query } = req.query 
  const ITEMS_PER_PAGE = limit || 6
  const skip = ((page || 1) - 1) * ITEMS_PER_PAGE
  const {{ singleName }}InfoAll = await count{{ tableName }}(
    req.db,
    req.query.before ? new Date(req.query.before) : undefined,
    req.query.by
  )
  const countPromise = {{ singleName }}InfoAll.length
  // add skip and limit query for pagination
  {% if table.beforeRetrieve %}{{ table.beforeRetrieve }}{% endif %}
  const {{ singleName }}Info = await find{{ tableName }}(
    req.db,
    query,
    skip,
    ITEMS_PER_PAGE
  )
  const [count, items] = await Promise.all([countPromise, {{ singleName }}Info])
  const pageCount = Math.ceil(countPromise / ITEMS_PER_PAGE)

  return res.json({
    pagination: {
      count,
      pageCount,
    },
    {{ tableName }}: items,
  })
}