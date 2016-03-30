source 'https://rubygems.org'

gem 'rails', '4.2.6'
gem 'rails-api', '0.4.0'
gem 'active_model_serializers', '0.10.0.rc4'
gem 'pg'
gem 'rack-cors'

group :assets, :development, :test, :production do
  gem 'simple_form', '~> 3.2'
  gem 'foundation-rails', '~> 6.2'
  gem 'sass-rails', '~> 5.0'
  gem 'jquery-rails'
  gem 'turbolinks'
  gem 'uglifier', '>= 1.3.0'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'debbie'
  gem 'rubocop', '0.37.2'
  gem 'annotate'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  gem 'puma'
end
