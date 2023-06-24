/*
path: show.tpl
completePath: elements/Fields/Bytes/show.tpl
unique_id: Tbbbbbno
*/
{% set bpr %}
import Field from '../components/Table/Field'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set ph %}
function formatBytes(bytes: number, decimals = 2): string {
  if (bytes === 0 || !bytes) {
    return '0 Bytes';
  }

  const sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
  const k = 1024;
  const dm = decimals < 0 ? 0 : decimals;
  const i = Math.floor(Math.log(bytes) / Math.log(k));

  return parseFloat((bytes / Math.pow(k, i)).toFixed(dm)) + ' ' + sizes[i];
}
{% endset %}
{{ save_delayed('ph',ph)}}
<Field value={(fieldData: any) => formatBytes(fieldData.{{ field.column_name | friendly }})}/>