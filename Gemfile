source 'https://rubygems.org'

ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use Postgres as the database for Active Record
gem 'pg'
gem 'postgres-pr'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# switch to bootstrap, rspec, factory_girl, selenium, capybara
# bootstrap css
gem 'bootstrap-sass'            # need to comment out before move to jQuery Mobile? there may be something still depending on it
gem 'bootstrap-sass-rails'    # no apparent benefit, inspite of greater specificity
gem 'bootstrap-will_paginate' # fix up will_paginate stuff to match bootstrap, produced no apparent improvement
gem 'will_paginate-bootstrap' # this gem didn't make any difference either...

## load capybara before rspec
## how does capybara drive the web? via Rack::Test & Selenium
group :development, :test do
  gem 'selenium-webdriver'
  gem 'capybara', '>= 2.0.0'
  # launchy makes available a 'save_and_open_page' command to see the page
  #   -- you have to have visited the page before you can do this!
  #   -- since launchy is being called via capybara, 
  #     -- you have to be 'inside' capybara in some sense, 
  #     i.e. using 'it' rather than 'describe'
  gem 'launchy'
end

# keep factory girl in development for testing at the console
group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  # webrat is at odds with much of our system
  # gem 'webrat', '>= 0.7.2'    # added in to see if it would help resolve some problems with the sitemap testing, no impact
end

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# not using jquery_mobile so leave this out
# gem 'jquery_mobile_rails' # http://rubydoc.info/gems/jquery_mobile_rails/1.3.2/frames

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# rely on 'devise' for security, so skip the ActiveModel has_secure_password stuff
# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

gem 'faker'
gem 'will_paginate'
gem 'bootstrap-will_paginate' ## no longer using bootstrap

gem 'font-awesome-sass' # from the website: http://fortawesome.github.io/Font-Awesome/get-started/
                        # and https://github.com/FortAwesome/font-awesome-sass

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'rdoc'

## on load to heroku you will see:
##  -----> WARNINGS:
##         Include 'rails_12factor' gem to enable all platform features
##         See https://devcenter.heroku.com/articles/rails-integration-gems for more information.
## ignore this suggestion; it is a disaster

gem 'devise'

gem 'paperclip'

gem 'leaflet-rails'
