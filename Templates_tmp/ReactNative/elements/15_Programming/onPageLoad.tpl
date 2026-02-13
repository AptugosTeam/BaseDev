/*
path: onPageLoad.tpl
type: file
unique_id: flR4cNG4
icon: ico-field
helpText: Executes commands when DOM has been loaded and renderized
*/
{% set bpr %}import { useFocusEffect } from '@react-navigation/native'{% endset %}{{ save_delayed('bpr',bpr)}}
useFocusEffect(
    React.useCallback(() => {
        {{ content | raw }}
    },[])
)
