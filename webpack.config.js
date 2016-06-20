module.exports = {
    entry: './src/entry.js',
    output: {
      path: './bin',
      filename: "bundle.js"
    },
    module: {
        loaders: [
            { test: /\.coffee$/, loader: 'coffee' },
            { test: /\.jade$/, loader: 'jade' },
            { test: /\.less$/, loader: 'style!css!less' }
        ]
    }
};
