/*
path: 999_allowedOrigins.js
keyPath: elements/Experimental/AllowedOrigins/999_allowedOrigins.js
unique_id: Vrpp9Mbv
internalUse: true
*/
const verifyOrigin = (req, res, next) => {
  // Temporalmente desactivado hasta resolver el insert_setting, 
  // la funcion se mueve al tpl
  const allowedDomains = [{{ insert_setting ('AllowedOrigins') | default ('') }}]
const origin = req.headers.origin


if (!origin || !allowedDomains.includes(origin)) {
  return res.status(403).json({ error: {{ insert_setting ('AllowedMessage') | default("'Unauthorized'") }}  });
  }
next();
};

module.exports = verifyOrigin;
