/*
path: webpack.bundleanalyze.js
completePath: config/addons/webpack.bundleanalyze.js
unique_id: TVJWFdeH
*/
const WebpackBundleAnalyzer = require('webpack-bundle-analyzer').BundleAnalyzerPlugin
 
module.exports = {
  plugins: [
    new WebpackBundleAnalyzer({
      analyzerMode: 'static',
      reportFilename: './report.html',
      openAnalyzer: false
    })
  ]
}