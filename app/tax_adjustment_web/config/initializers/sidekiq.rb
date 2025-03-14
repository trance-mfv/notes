# frozen_string_literal: true

require 'sidekiq/web'
require Rails.root.join('lib/sidekiq/filter_log')

# attempt_wait_time formula
#   attempt_wait_time = [(reconnect_delay * 2**(redis_reconnect_delay-1)), reconnect_delay_max].min
# ref:
#   https://www.rubydoc.info/gems/redis/4.6.0#reconnections

Sidekiq.configure_server do |config|
  config.redis = Rails.application.config_for(:redis).symbolize_keys
  # https://github.com/mperham/sidekiq/wiki/Error-Handling#error-handlers
  config.error_handlers << proc { |ex,ctx_hash| Rollbar.error(ex, ctx_hash) }
  # Configure Sidekiq logger to show ActiveRecord logs
  Sidekiq.logger.level = Logger::DEBUG
  # Configure ActiveRecord to use Sidekiq's logger with DEBUG level
  ActiveRecord::Base.logger = Sidekiq.logger
  ActiveRecord::Base.logger.level = Logger::DEBUG
  # logger
  config.log_formatter = Sidekiq::FilterLog.new if Rails.env.production? || Rails.env.staging?
end

Sidekiq.configure_client do |config|
  config.redis = Rails.application.config_for(:redis).symbolize_keys
end

Sidekiq::Web.use Rack::Auth::Basic do |username, password|
  [username,password] == [ENV.fetch("SIDEKIQ_USER"),ENV.fetch("SIDEKIQ_PASSWORD")]
end
