const { environment } = require('@rails/webpacker')

// jQueryとBootstrapのJSを使えるように
const webpack = require('webpack')
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    Popper: ['@popperjs/core', 'default']
  })
)

module.exports = environment
