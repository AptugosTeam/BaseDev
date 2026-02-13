/*
path: metro.config.js
completePath: front-end/metro.config.js
unique_id: M0SHTfZ3
*/
const { getDefaultConfig } = require('expo/metro-config')

const config = getDefaultConfig(__dirname)
config.transformerPath = require.resolve("./transform-worker.js"),
config.transformer = {
  ...config.transformer,
  babelTransformerPath: require.resolve('react-native-sass-transformer'),
}

config.resolver.sourceExts.push('scss', 'sass')

module.exports = config
