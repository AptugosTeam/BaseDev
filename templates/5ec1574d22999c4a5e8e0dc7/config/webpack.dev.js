/*
path: webpack.dev.js
completePath: config/webpack.dev.js
unique_id: n119zEq4
*/
// development config
const { merge } = require('webpack-merge')
const webpack = require('webpack')
const commonConfig = require('./webpack.common')
const path = require('path')
module.exports = merge(commonConfig, {
  mode: 'development',
  entry: [
    'webpack-dev-server/client?http://127.0.0.1:8080', // bundle the client for webpack-dev-server and connect to the provided endpoint
    './front-end/index.tsx', // the entry point of our app
  ],
  output: {
    publicPath: '/',
  },
  devServer: {
    open: true,
    hot: true,
    liveReload: true,
    historyApiFallback: true,
    static: {
      directory: path.resolve(__dirname, '..', 'dist'),
      watch: {
        ignored: path.resolve(__dirname, '..', 'dist', 'img'),
        usePolling: false,
      },
    },
    watchFiles: {
      paths: [path.resolve(__dirname, '..', 'src')]
    },
    client: {
      overlay: false,
      progress: true,
    },
  },
  devtool: 'cheap-module-source-map',
  plugins: [
    new webpack.HotModuleReplacementPlugin(), // enable HMR globally
  ],
})

