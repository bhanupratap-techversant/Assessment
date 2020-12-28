const { environment } = require('@rails/webpacker')

const webpack = require('webpack')

environment.plugins.append('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popover: ['popover.js', 'default']
  })
  )

module.exports = environment
