require 'simplecov'
require 'simplecov-console'
require 'capybara/rspec'
require 'pg'
require 'features/setup_test_database'
require 'persisted_data_helpers'
require 'features/web_helpers'

ENV['ENVIRONMENT'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

Capybara.app = ChitterApp

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  SimpleCov::Formatter::HTMLFormatter
  ])
  SimpleCov.start

  RSpec.configure do |config|
    config.after(:suite) do
      puts
      puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
      puts "\e[33mTry it now! Just run: rubocop\e[0m"
    end
  end

  RSpec.configure do |config|
    config.before(:each) do
      setup_test_database
    end
  end
