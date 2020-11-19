require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RenrakuChild
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.i18n.default_locale = :ja
    config.paths.add 'lib', eager_load: true # 追加
    # config.time_zone = 'Asia/Tokyo'
    Refile.secret_key = '9e5af3d59bedba787425f7de239bdd1600fbddf5e58388f2ce41b79261b59f28619102234644ac39499ca63d0c2f8b2704056d3032aa1ad9841248ba4fb6389f'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
