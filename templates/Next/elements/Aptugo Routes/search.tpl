/*
path: search.tpl
type: file
unique_id: 36m5BEAd
icon: ico-field
children: []
*/
async (req, res) => {
  if (!req.query) req.query = {}
  const ITEMS_PER_PAGE = Number(req.query.limit) || 10
  req.query.skip = ((req.query.page || 1) - 1) * ITEMS_PER_PAGE
  const {{ singleName }}InfoAll = await count{{ tableName }}(
    req.db,
    req.query
  )
  const countPromise = {{ singleName }}InfoAll.length
  
  {% if table.beforeRetrieve %}{{ table.beforeRetrieve }}{% endif %}
  const {{ singleName }}Info = await find{{ tableName }}(
    req.db,
    req.query
  )
  const [count, items] = await Promise.all([countPromise, {{ singleName }}Info])
  const pageCount = Math.ceil(countPromise / ITEMS_PER_PAGE)

  return res.json({
    pagination: {
      count,
      pageCount,
    },
    {{ tableName }}: items,
  })
}