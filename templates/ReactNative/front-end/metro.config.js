/*
path: metro.config.js
completePath: front-end/metro.config.js
unique_id: M0SHTfZ3
*/
// Learn more https://docs.expo.io/guides/customizing-metro
const { getDefaultConfig } = require('expo/metro-config');
const path = require('path')

const config = getDefaultConfig(__dirname);

config.resolver.sourceExts.push('scss')
config.resolver.sourceExts.push('sass')
config.resolver.extraNodeModules = {
  dist: path.resolve(__dirname, '../dist')
}

config.watchFolders = [path.resolve(__dirname), path.resolve(__dirname, '../dist')]
config.transformer = {
  babelTransformerPath: require.resolve("react-native-sass-transformer")
}
module.exports = config