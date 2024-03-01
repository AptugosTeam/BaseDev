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
