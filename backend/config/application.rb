require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Backend
   class Application < Rails::Application
     # We want to set up a custom logger which logs to STDOUT.
     # Docker expects your application to log to STDOUT/STDERR and to be ran
     # in the foreground.
     config.log_level = :debug
     config.log_tags  = [:subdomain, :uuid]
     config.logger    = ActiveSupport::TaggedLogging.new(Logger.new(STDOUT))

     # Since we're using Redis for Sidekiq, we might as well use Redis to back
     # our cache store. This keeps our application stateless as well.
     config.cache_store = :redis_store, ENV['CACHE_URL'],
                          { namespace: 'drkiq::cache' }

     # If you've never dealt with background workers before, this is the Rails
     # way to use them through Active Job. We just need to tell it to use Sidekiq.
     config.active_job.queue_adapter = :sidekiq

     # ...
   end
end
