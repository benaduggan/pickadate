UnknownBusiness::Application.configure do
  
  ENV['FACEBOOK_APP_ID'] = "1477351682523369";
  ENV['FACEBOOK_SECRET'] = "d45640698354566d1d0c8261ce499a2f";
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Mailer Options
  config.action_mailer.default_url_options = { :host => 'http://happy-fun-time-27279.use1.nitrousbox.com' }
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :address        => 'smtp.gmail.com',
    :domain         => 'http://happy-fun-time-27279.use1.nitrousbox.com',
    :port           => 587,
    :user_name      => 'rszemplinski22@gmail.com',
    :password       => 'nazdbuhjthckicru',
    :authentication => :plain
}
  
  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true
end
