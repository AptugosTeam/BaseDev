/*
path: dialogTitle.tpl
completePath: elements/Material-UI/dialogTitle.tpl
unique_id: 4lluC3o0
*/
{% set bpr %}
import {Dialog } from 'react-native-paper'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Dialog.Title>{{ content | raw }}</Dialog.Title>