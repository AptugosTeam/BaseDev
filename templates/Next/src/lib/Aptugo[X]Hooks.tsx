/*
path: "{{ table.name |\_friendly |\_lower }}/hooks.tsx"
type: file
unique_id: gSp3dUQW
icon: ico-field
modelRelated: true
sourceType: javascript
subtype: Aptugo
children: []
*/
{% set tableName = table.name | friendly | lower %}
{% set singleName = table.singleName | friendly | lower %}
import { fetcher } from "../fetch"
import useSWR from "swr"
import { useRouter } from 'next/router'

export function use{{ tableName }}(limit = undefined) {
  const { data, error } = useSWR(
    `/api/{{ tableName }}?limit=${limit ?? Number.MAX_SAFE_INTEGER}`,
    fetcher
  );
  return {
    {{ singleName }}data: data,
    {{ singleName }}isLoading: !error && !data,
    {{ singleName }}isError: error,
  };
}

export function use{{ singleName }}({ {{ singleName }}Id }) {
  const { data, error } = useSWR(`/api/{{ tableName }}/${ {{ singleName }}Id}`, fetcher);

  return {
    {{ singleName }}data: data?.data.docs,
    {{ singleName }}isLoading: !error && !data,
    {{ singleName }}isError: error,
  };
}

export function use{{ tableName }}Pages(options) {
  const urlSearchParams = new URLSearchParams(options)
  const shouldFetch = options.isReady
    ? `/api/{{ tableName }}?${urlSearchParams.toString()}`
    : null

  const { data, error } = useSWR(shouldFetch, fetcher)
  return {
    {{ singleName }}data: data?.data.docs,
    {{ singleName }}isLoading: !error && !data,
    {{ singleName }}isError: error,
    {{ singleName }}pages: data?.data.totalPages,
  }
}
