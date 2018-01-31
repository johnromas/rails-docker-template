gem 'active_model_serializers', '~> 0.10.0'
gem 'devise_token_auth', branch: 'master'
gem 'delayed_job_active_record'
gem 'figaro'
gem 'httparty'
gem 'omniauth'
gem 'rack-cors'

gem_group :development, :test do
  gem 'pry'
end

# run "bundle exec rake rails:update:bin"
# run "bundle exec figaro install"
# run "rails g delayed_job:active_record"
# run "rails g devise_token_auth:install User auth"

# rails_command "db:migrate"

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
