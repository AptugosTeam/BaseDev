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

  plugins.push('react-native-reanimated/plugin')
  
  plugins.push([
    'module-resolver',
    {
      root: ['.'],
      extensions: ['.js', '.ts', '.tsx', '.json'],
      alias: {
        '@assets': './assets',
      },
    },
])
  return {
    presets, plugins
  }
}
