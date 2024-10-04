/*
path: Aptugo.tpl
type: file
unique_id: uarZVaaa
icon: ico-field
internalUse: true
children: []
*/
{% set bpr %}

const AptugoContentEditor = (props) => {
  const editorRef = React.useRef<any>()

  React.useEffect(() => {
    if (editorRef.current.innerHTML !== props.value) editorRef.current.innerHTML = props.value
  }, [props.value])

  const onChange = (e) => {
    if (props.value !== e.currentTarget.innerHTML) {
      props.onChange(e.currentTarget.innerHTML)
    }
  }

  return <div contentEditable={true} ref={editorRef} onInput={onChange}></div>
}

{% endset %}
{{ save_delayed('bpr',bpr) }}
<FormControl margin="normal" size="medium" variant='standard' fullWidth>
  <InputLabel htmlFor='contentsInput' shrink>Contents</InputLabel>
  <AptugoContentEditor
    value={ {{ tableName }}data.{{ field.column_name | friendly | lower }} || ''} 
    onChange={e => handle{{ tableName }}Change('{{ field.column_name | friendly | lower }}')(e)}
  />
</FormControl>