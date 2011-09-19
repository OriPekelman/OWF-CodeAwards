source 'http://rubygems.org'
gem 'rails', '3.1.0'
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end
gem "rspec-rails", ">= 2.6.1", :group => [:development, :test]
gem "database_cleaner", ">= 0.6.7", :group => :test
gem "mongoid-rspec", ">= 1.4.4", :group => :test
gem "factory_girl_rails", ">= 1.2.0", :group => :test
gem "devise", ">= 1.4.4"
gem "bson_ext", ">= 1.3.1"
gem "mongoid"
gem 'scoped-search'
gem 'mongoid_slug', :require => 'mongoid/slug'
gem 'mongoid_search'
gem "omniauth", "~> 0.3.0.rc3"
gem "mongoid_taggable"
gem "mongoid_taggable_with_context", "~> 0.7.2"
gem 'voteable_mongo'            
gem "cancan"

group :production do
#  gem 'therubyracer-heroku', '0.8.1.pre3'
   gem 'mongrel', '1.2.0.pre2'
end