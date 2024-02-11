/*
path: babel.config.js
completePath: front-end/babel.config.js
unique_id: EMoVmyLd
*/
module.exports = function(api) {
  api.cache(true);

  const plugins = ['transform-inline-environment-variables']
  const presets = ['babel-preset-expo']

  {{ insert_setting('BabelAdd') | raw }}
  return {
    presets, plugins
  };
};
