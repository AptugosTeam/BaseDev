/*
path: schemaUtils.js
completePath: back-end/models/schemaUtils.js
unique_id: w4K1aUXT
*/
function applySoftDeleteMiddleware (schema) {
  const softDeletefilter = { $or: [{ isDeleted: false }, { isDeleted: { $exists: false } }] }

  function applyFilter () {
    if (!this.options.skipDeletedFilter) {
      this.where(softDeletefilter)
    }
  }

  schema.pre(/^find/, applyFilter)
  schema.pre('countDocuments', applyFilter)
  schema.pre(['updateOne', 'updateMany', 'findOneAndUpdate', 'findByIdAndUpdate'], applyFilter)
}

module.exports = {
  applySoftDeleteMiddleware
}