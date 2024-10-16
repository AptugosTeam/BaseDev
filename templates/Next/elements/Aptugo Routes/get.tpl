/*
path: get.tpl
completePath: elements/Aptugo Routes/get.tpl
unique_id: AlPg3QRE
*/
async (req, res) => {
  const ITEMS_PER_PAGE = Number(req.query.limit) || 10
  const page = req.query.page || 1
  const skip = (page - 1) * ITEMS_PER_PAGE
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
    req.query.before ? new Date(req.query.before) : undefined,
    req.query.by,
    req.query.skip ? req.query.skip : skip,
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