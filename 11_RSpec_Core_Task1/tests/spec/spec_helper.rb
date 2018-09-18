require 'watir'
require 'rspec/expectations'
require 'rspec'
require 'page-object'
require 'require_all'
require 'faker'
require_relative '../support/models/user'
require 'rspec/expectations'
require 'rspec'
require_all 'lib'

RSpec.configure do |config|
  config.include PageObject::PageFactory
  config.include RSpec::Matchers
  config.before :all do
    @browser = Watir::Browser.new :firefox
  end
  config.after :all do
    @browser.quit
  end
end