var HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
    entry: './src/entry.js',
    output: {
      path: './bin',
    },
    module: {
        loaders: [
            { test: /\.coffee$/, loader: 'coffee' },
            { test: /\.jade$/, loader: 'jade' },
            { test: /\.less$/, loader: 'style!css!less' }
        ]
    },
    plugins: [
      new HtmlWebpackPlugin({
        template: './src/index.jade',
        filename: 'index.html'
      })
    ]
};
