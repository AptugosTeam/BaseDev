/*
path: 997_userHook.tsx
completePath: >-
  /Users/gastongorosterrazu/Aptugo/BaseDev/templates/Next/elements/Programming/Snippets/extraFiles/997_userHook.tsx
keyPath: elements/Programming/Snippets/extraFiles/997_userHook.tsx
unique_id: pBciOdsa
*/
import useSWR from 'swr'
import { fetcher } from '../fetch'

export function useCurrentUser() {
  const { data, error } = useSWR(`/api/user`, fetcher)
  return {
    data: data?.user,
    isLoading: !error && !data,
    isError: error,
  }
}
