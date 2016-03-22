var path = require('path');

module.exports = {
    entry: './src/index.js',
    output: {
        path: __dirname,
        filename: 'bundle.js'
    },
    module: {
        loaders: [{
                test: /\.js$/,
                loader: 'babel-loader',
                exclude: /node_modules/,
                query: {
                    presets: ['es2015']
                }
            }, {
                test: /\.tag$/,
                loader: 'tag',
                exclude: /node_modules/
            },
            { test: /\.css$/, loader: "style-loader!css-loader" },
            { test: /\.(eot|woff|woff2|ttf|svg)$/, loader: "url-loader?limit=30000" },
            { test: /\.png$/, loader: "url-loader?mimetype=image/png" },
            { test: /\.jpg$/, loader: "file-loader" }
        ]
    }
}