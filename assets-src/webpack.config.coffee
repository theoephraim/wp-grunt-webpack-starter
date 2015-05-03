path = require 'path'

webpack = require 'webpack'
ExtractTextPlugin = require 'extract-text-webpack-plugin'
CommonsChunkPlugin = webpack.optimize.CommonsChunkPlugin

module.exports =
  context: "assets-src"
  entry:
    'core-bundle': './scripts/core-bundle.js' #explicit common bundle
    'core-style': './scripts/core-style.js'  # dummy bundle to compile CSS

    # add other scripts to compile
    #'contact-page': './scripts/pages/contact.coffee'
  output:
    path: "assets"
    filename: 'js/[name].js'
    sourceMapFilename: 'js/[name].map'

  resolve:
    extensions: ['', '.js', '.json', '.coffee']
    modulesDirectories: ['assets-src/javascript', 'assets-src/lib-bower', 'assets-src/less']

  module:
    loaders: [
      { test: /\.coffee$/, loader: 'coffee' }
      # { test: /\.less$/, loader: 'style!css!less' }
      { test: /\.css$/, loader: ExtractTextPlugin.extract('style', 'css') }
      { test: /\.less$/, loader: ExtractTextPlugin.extract('style', 'css!less') }
      { test: /\.png$/, loader: "file-loader" }
      { test: /\.jpg$/, loader: "file-loader" }
    ]

  plugins: [
    new webpack.ResolverPlugin(
      new webpack.ResolverPlugin.DirectoryDescriptionFilePlugin('bower.json', ['main'])
    ),

    new ExtractTextPlugin('css/core.css', { allChunks: true }),
    # new ExtractTextPlugin('css/[name].css'),

    # explicitly make core-bundle a "common" chunk bundle
    # so other bundles will not include things already loaded
    new CommonsChunkPlugin({ name: 'core-bundle' })
  ]

  stats:
    colors: false
    modules: true
    reasons: true

  failOnError: false

  watch: true