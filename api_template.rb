gem 'active_model_serializers', '~> 0.10.0'
gem 'devise_token_auth'
gem 'delayed_job_active_record'
gem 'figaro'
gem 'httparty'
gem 'omniauth'
gem 'rack-cors'

gem_group :development, :test do
  gem 'pry'
end

application "
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.log_tags  = [:subdomain, :uuid]
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
"
environment "config.active_job.queue_adapter = :delayed_job"
environment "
  config.middleware.use Rack::Cors do
    allow do
      origins '*'
      resource '*',
        :headers => :any,
        :expose  => ['access-token', 'expiry', 'token-type', 'uid', 'client'],
        :methods => [:get, :post, :options, :delete, :put]
    end
  end
", env: 'development'
