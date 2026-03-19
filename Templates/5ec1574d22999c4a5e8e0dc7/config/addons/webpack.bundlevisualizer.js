/*
path: webpack.bundlevisualizer.js
completePath: config/addons/webpack.bundlevisualizer.js
unique_id: sGHkXddE
*/
const Visualizer = require('webpack-visualizer-plugin')
 
module.exports = {
  plugins: [
    new Visualizer()
  ]
}