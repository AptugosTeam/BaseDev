/*
path: nc.tsx
completePath: /Users/gastongorosterrazu/Aptugo/BaseDev/templates/Next/src/api-lib/nc.tsx
keyPath: src/api-lib/nc.tsx
unique_id: 39RpGT4k
*/
export const ncOpts = {
  onError(err, req, res) {
    console.error(err);
    res.statusCode =
      err.status && err.status >= 100 && err.status < 600 ? err.status : 500;
    res.json({ message: err.message });
  },
};
