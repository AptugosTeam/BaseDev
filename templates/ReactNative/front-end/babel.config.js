/*
path: babel.config.js
completePath: front-end/babel.config.js
unique_id: EMoVmyLd
*/
module.exports = function(api) {
  api.cache(true);
  return {
    presets: ['babel-preset-expo'],
    plugins: ['transform-inline-environment-variables', 'react-native-iconify/plugin'],
  };
};
