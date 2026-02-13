/*
path: onPageLoad.tpl
type: file
unique_id: flR4cNG4
icon: f:onPageLoad.svg
helpText: Executes commands when DOM has been loaded and renderized
options:
  - name: useEffectBody
    display: Body
    type: function
    options: ''
*/
React.useEffect(() => {
    {{ element.values.useEffectBody | raw }}
    {{ content | raw }}
},[])
