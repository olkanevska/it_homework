require 'selenium-webdriver'
require'rspec/expectations'
require_relative'helper_methods'
require_relative 'no_bug_issue_error'

World(RSpec::Matchers) #to make rspec matchers work
World(HelperMethods)