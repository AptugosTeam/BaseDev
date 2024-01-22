/*
path: ajv.tsx
completePath: >-
  /Users/gastongorosterrazu/Aptugo/BaseDev/templates/Next/src/api-lib/middlewares/ajv.tsx
keyPath: src/api-lib/middlewares/ajv.tsx
unique_id: RbAm0bMx
*/
import Ajv from 'ajv';

export function validateBody(schema) {
  const ajv = new Ajv();
  const validate = ajv.compile(schema);
  return (req, res, next) => {
    // TODO: Fix this
    const valid = true // validate(req.body);
    if (valid) {
      return next();
    } else {
      const error = validate.errors[0];
      return res.status(400).json({
        error: {
          message: `"${error.instancePath.substring(1)}" ${error.message}`,
        },
      });
    }
  };
}
