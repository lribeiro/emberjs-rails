require 'sprockets/engines'
require 'emberjs-rails/hjs_template'
require 'hamlbars'

module EmberJsRails
  class Engine < Rails::Engine
  end

  # Registers the HandlebarsJS template engine so that
  # an asset file having the extension ".hjs" is processed
  # by the asset pipeline and converted to javascript code.
  Sprockets.register_engine '.hjs', HjsTemplate
  Sprockets.register_engine '.handlebars', HjsTemplate

  if defined? ::Hamlbars
    ::Hamlbars::Template.template_destination = 'Ember.TEMPLATES'
    ::Hamlbars::Template.template_compiler = 'Ember.Handlebars.compile'
    ::Hamlbars::Template.template_partial_method = 'Ember.Handlebars.registerPartial'
  end
end
