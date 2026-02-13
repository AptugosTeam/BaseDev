/*
path: ocr.tpl
type: file
unique_id: ocr37bpk
icon: ico-ocr
sourceType: javascript
settings:
  - name: Packages
    value: '"tesseract.js": "^2.1.5",'
options:
  - name: whitelist
    display: Whitelist
    type: text
    options: ''
children: []
*/
{% set bpr %}
import Tesseract from 'tesseract.js'
{% endset %}
{{ save_delayed('bpr', bpr) }}
(async () => {
  const worker = Tesseract.createWorker({
    logger: m => console.log(m)
  })
  await worker.load()
  await worker.loadLanguage('eng')
  await worker.initialize('eng')
  {% if element.values.whitelist %}
  worker.setParameters({
    tessedit_char_whitelist: {{ element.values.whitelist | textOrVariable }},
  })
  {% endif %}
  worker.recognize(imagePath)
    .catch (err => {
      console.error(err);
    })
    .then(result => {
      {{ content | raw }}
    })
})()