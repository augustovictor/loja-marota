source 'http://rubygems.org'

gem 'rails', '3.1.1'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'haml' #metodo de escrita html

gem 'less-rails-bootstrap', '1.3.3' #bootstrap twitter

gem 'mysql2' #banco de dados

gem 'sunspot_rails' #ferramenta para busca textual no banco de dados

gem 'will_paginate' #pagicaçao

group :test do #executada quando esta no modo test
  gem 'rspec-rails' #testes
  gem 'capybara'
  gem 'shoulda'
  gem 'factory_girl'
  #Jenkins - Servidor de testes. Toda vez que ha um commit, o servidor roda todos os testes.
  gem 'ZenTest' #gerramenta autotest (fica rodando em loop infinito os seus testes. Conforme o desenvolvimento da app, os testes sao executados)
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
  gem 'therubyracer'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end
