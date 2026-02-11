/*
path: store.tsx
completePath: front-end/store/store.tsx
unique_id: 6E6TtRQh
*/
import { configureStore } from '@reduxjs/toolkit'
import { useDispatch } from 'react-redux'

{% for table in application.tables %}
import {{ table.name | friendly | lower }}Reducer from './slices/{{ table.name | friendly | lower }}Slice'
{% endfor %}

export const store = configureStore({
  reducer: {
    {% for table in application.tables %}
    {{ table.name | friendly | lower }}: {{ table.name | friendly | lower }}Reducer,
    {% endfor %}
  },
  middleware: (getDefaultMiddleware) => 
    getDefaultMiddleware({
      serializableCheck: false,
    }),
})

export type RootState = ReturnType<typeof store.getState>
export type AppDispatch = typeof store.dispatch
export const useAppDispatch = () => useDispatch<AppDispatch>()

export default store