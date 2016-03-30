# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)
# Production namespace like `https://my_url/breizhtrip/legacies`
map ENV['BREIZHTRIP_NAMESPACE'] if ENV['BREIZHTRIP_NAMESPACE']
run Rails.application

require 'rack/cors'
use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: %i(get post put patch delete options)
  end
end
