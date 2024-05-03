/*
path: allowedOrigins.tpl
completePath: elements/Experimental/AllowedOrigins/allowedOrigins.tpl
type: file
unique_id: allowErt8
icon: ico-field
options:
  - name: allowed
    display: Approved Domains
    type: text
    required: true
  - name: error
    display: Error message to display
    type: text
settings:
  - name: ServerAddenum
    value: |-
      const verifyOrigin = (req, res, next) => {
        const allowedDomains = [{{ element.values.allowed | default ('') }}]
        const origin = req.headers.origin
        if (!origin || !allowedDomains.includes(origin)) {
          return res.status(403).json({ error: '{{ element.values.error | default("Unauthorized") }}'  });
          }
        next();
      };
      app.use(verifyOrigin)
*/


{% if element.values.allowed %}
  {% set ALLOW %}[ {{ element.values.allowed }} ]{% endset %}
  {{ add_setting('AllowedOrigins', ALLOW) }}
{% endif %}

{% if element.values.error %}
  {% set ERR %}{{ element.values.error }}{% endset %}
  {{ add_setting('AllowedMessage', ERR) }}
{% endif %}

