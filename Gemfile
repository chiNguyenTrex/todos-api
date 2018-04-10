source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.6'
gem 'sqlite3'
gem 'puma', '~> 3.7'
gem 'bcrypt'
gem 'jwt'
gem 'active_model_serializers'

group :development, :test do
  gem 'pry-byebug'
  gem 'rspec-rails', '~> 3.7'
  gem 'shoulda-matchers'
  gem "factory_bot_rails"
  gem 'faker'
  gem 'database_cleaner'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
