/*
path: onPageLoad.tpl
type: file
unique_id: flR4cNG4
icon: ico-field
helpText: Execute code when the current screen gains focus and is ready to run side effects
*/
{% set bpr %}import { useFocusEffect } from '@react-navigation/native'{% endset %}{{ save_delayed('bpr',bpr)}}
useFocusEffect(
    React.useCallback(() => {
        {{ content | raw }}
    },[])
)
