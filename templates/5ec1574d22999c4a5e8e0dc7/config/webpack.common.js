/*
path: webpack.common.js
completePath: config/webpack.common.js
unique_id: EpA5lGLz
*/
// shared config (dev and prod)
const { resolve } = require('path')
const HtmlWebpackPlugin = require('html-webpack-plugin')
const ProvidePlugin = require('webpack/lib/ProvidePlugin')
const webpack = require('webpack')
const isProduction = process.env.NODE_ENV === 'production';
const envFile = isProduction ? '.env.production' : '.env.development';
const envPath = resolve(__dirname, envFile);
const envVars = require('dotenv').config({ path: envPath }).parsed || {};
module.exports = {
  resolve: {
    extensions: ['.js', '.jsx', '.ts', '.tsx', '.css'],
    alias: {
      dist: resolve(__dirname, '../', 'dist'),
      process: 'process/browser',
      stream: 'stream-browserify',
      zlib: 'browserify-zlib',
      '@components': resolve(__dirname, '../', 'front-end/components'),
      '@services': resolve(__dirname, '../', 'front-end/services'),
      '@store': resolve(__dirname, '../', 'front-end/store'),
      '@helpers': resolve(__dirname, '../', 'front-end/helpers'),
      "react/jsx-dev-runtime.js": "react/jsx-dev-runtime",
      "react/jsx-runtime.js": "react/jsx-runtime",
    },
    fallback: {
      'process/browser': require.resolve('process/browser'),
      assert: require.resolve('assert/')
    }
  },
  context: resolve(__dirname, '../'),
  module: {
    rules: [
      {
        test: /\.m?js$/,
        resolve: {
          fullySpecified: false
        },
      },
      {
        test: [/\.jsx?$/, /\.tsx?$/],
        use: ['babel-loader'],
        exclude: /node_modules/,
      },
      {
        test: /\.css$/,
        use: ['style-loader', 'css-loader'],
      },
      {
        test: /\.(scss|sass)$/,
        use: ['style-loader', {
          loader: 'css-loader', options: {
            url: false,
            modules: {
              localIdentName: "[path][name]__[local]--[hash:base64:5]",
            },
          }
        }, { loader: 'sass-loader', options: { api: "modern", sourceMap: true } }]
      },
      {
        test: /\.(woff|woff2|eot|ttf|otf)$/i,
        use: 'file-loader'
      },
      {
        test: /\.(jpe?g|png|gif|svg)$/i,
        use: [
          'file-loader?hash=sha512&digest=hex&name=img/[contenthash].[ext]',
          'image-webpack-loader?bypassOnDebug&optipng.optimizationLevel=7&gifsicle.interlaced=false',
        ],
      },
    ],
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: './dist/index.html',
      inject: true,
      minify: {
        removeComments: true,
        collapseWhitespace: true,
      },
    }),
    new ProvidePlugin({
      process: 'process/browser',
      Buffer: ['buffer', 'Buffer'],
    }),
    new webpack.DefinePlugin({
      'process.env': JSON.stringify(envVars)
    })],
  externals: {
    react: 'React',
    'react-dom': 'ReactDOM',
  },
  performance: {
    hints: false,
  },
}
