/*
path: register.tpl
type: file
unique_id: yZDJR2J4
icon: ico-field
sourceType: javascript
options:
  - name: Data
    display: Data variable
    type: text
    required: true
  - name: OnSuccess
    display: On Successful Register
    type: dropdown
    options: return aptugo.pageUtils.getAllPages()
    required: true
children: []
*/
{% set bpr %}
import { fetcher } from '@lib/fetch'
{% endset %}
{{ save_delayed('bpr',bpr)}}
    try {
      if (data.profilepic) {
        const formData = new FormData()
        formData.append('_id', data._id)
        formData.append('file', data.profilepic)
        const response = await fetcher('/api/users', {
          method: 'PUT',
          body: formData,
        })
        data.profilepic = response.filename
      }

      await fetcher(`/api/users`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(data),
      })

    } catch (e) {
      console.log('catch', e)
    }