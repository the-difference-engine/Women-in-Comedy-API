require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WomenInComedyApi


    class Application < Rails::Application
      config.middleware.insert_before 0, Rack::Cors do
        allow do
        origins '*'
        resource '*', headers: :any, methods: %I[get put patch delete post options]
          end
        end

    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
        address: "smtp.gmail.com",
        port: 587,
        domain: "gmail.com",
        user_name: 'testwomenincomedy@gmail.com',
        password: 'womenincomedy',
        authentication: "plain",
        enable_starttls_auto: true
    }

  end
end
