# Load the Rails application.
require File.expand_path('../application', __FILE__)

autoload_paths = %W(#{Rails.root}/app/sweepers)
ENV['RAILS_ENV'] ||= 'production'
# Initialize the Rails application.
Rails.application.initialize!
