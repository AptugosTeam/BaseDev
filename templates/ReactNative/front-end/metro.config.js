/*
path: metro.config.js
completePath: front-end/metro.config.js
unique_id: M0SHTfZ3
*/
// Learn more https://docs.expo.io/guides/customizing-metro
const { getDefaultConfig } = require('expo/metro-config');
const path = require('path')

/** @type {import('expo/metro-config').MetroConfig} */

const config = getDefaultConfig(__dirname, {
  isCSSEnabled: true,
});
{{ insert_setting('MetroConfigAddenum') | raw }}

module.exports = config