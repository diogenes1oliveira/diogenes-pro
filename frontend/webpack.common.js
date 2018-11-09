const path = require('path');
const CleanWebpackPlugin = require('clean-webpack-plugin');
const HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
  entry: './src/index.jsx',
  output: {
    path: path.resolve(__dirname, 'dist'),
    filename: '[name].bundle.js',
  },
  module: {
    rules: [
      {
        test: /\.jsx?$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader',
          options: {sourceMap: true},
        },
      },
      {
        test: /\.css$/,
        exclude: /node_modules/,
        use: [
          {loader: 'style-loader', options: {sourceMap: true}},
          {loader: 'css-loader'},
        ],
      },
      {
        test: /\.(png|svg|gif|jpe?g)$/,
        exclude: /node_modules/,
        use: [
          'file-loader',
        ],
      }
    ],
  },
  resolve: {
    extensions: ['.js', '.jsx', '.wasm', '.mjs', '.json'],
  },
  plugins: [
    new CleanWebpackPlugin(['dist']),
    new HtmlWebpackPlugin({
      filename: 'index.html',
      template: './public/index.html',
    }),
  ]
};
