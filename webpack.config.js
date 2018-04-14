const path = require('path');

module.exports = {
  entry: './app/assets/javascripts/source/app.js',
  output: {
    path: path.join(__dirname, 'app/assets/javascripts'),
    filename: 'bundle.js'
  },
  module: {
    rules: [
      {
        exclude: /node_modules/,
        loader: 'babel-loader',
        test: /\.js$/,
      }
    ]
  },
  devtool: 'cheap-module-eval-source-map',
  mode: 'development'
};
