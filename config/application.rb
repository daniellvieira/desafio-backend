require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DesafioBackend
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.time_zone = 'Brasilia'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    config.i18n.enforce_available_locales = false
    config.i18n.available_locales         = [:'pt-BR']
    config.i18n.default_locale            = :'pt-BR'

    # Determines whether form_with generates remote forms or not. This defaults to true
    config.action_view.form_with_generates_remote_forms = false

    config.active_job.queue_adapter = :sidekiq

    # Initialize the constant state
    config.state = config_for(:state_constant)
  end
end