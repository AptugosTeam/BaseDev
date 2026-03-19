/*
path: 999_searchField.tsx
completePath: >-
  /Users/gastongorosterrazu/Aptugo/BaseDev/templates/Bootstrap/elements/Interact/999_searchField.tsx
keyPath: elements/Interact/999_searchField.tsx
unique_id: dKc7NJSF
*/
'use client'

import { MagnifyingGlassIcon } from '@heroicons/react/24/solid'
import { usePathname, useRouter } from 'next/navigation'
import { useTransition } from 'react'

import theme from './searchField.module.scss'

export default function Search({ disabled }: { disabled?: boolean }) {
  const { replace } = useRouter()
  const pathname = usePathname()
  const [isPending, startTransition] = useTransition()

  function handleSearch(term: string) {
    const params = new URLSearchParams(window.location.search)
    if (term) {
      params.set('q', term)
    } else {
      params.delete('q')
    }

    startTransition(() => {
      replace(`${pathname}?${params.toString()}`)
    })
  }

  return (
    <div className={theme.searchEncloser}>
      <label htmlFor="search" className={theme['sr-only']}>
        Search
      </label>
      <div className={theme.searchInput}>
        <div className={theme.magIcon} aria-hidden="true">
          <MagnifyingGlassIcon className={`${theme['mr-3']} ${theme['h-4']} ${theme['w-4']} ${theme['text-gray-400']}`} aria-hidden="true" />
        </div>
        <input
          type="text"
          name="search"
          id="search"
          disabled={disabled}
          className={`${theme.searchInputField} ${theme.formControl}`}
          placeholder="Search by name..."
          spellCheck={false}
          onChange={(e) => handleSearch(e.target.value)}
        />
      </div>

      {isPending && (
        <div className={theme.pendingArea}>
          <svg className={theme.spinner} xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
            <circle className={theme.circle} cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" />
            <path
              className={theme.path}
              fill="currentColor"
              d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"
            />
          </svg>
        </div>
      )}
    </div>
  )
}
