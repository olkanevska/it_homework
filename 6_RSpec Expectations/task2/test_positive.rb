require 'test/unit'
require 'selenium-webdriver'
require 'rspec'
require_relative 'our_module'
require_relative 'no_bug_issue_error'


class TestPositive < Test::Unit::TestCase
  include RSpec::Matchers
  include OurModule

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 30)
  end

  def test_register_user
    register_user

    flash_notice = @driver.find_element(:id, 'flash_notice')
    expect(flash_notice).to be_displayed
  end

  def test_log_out
    register_user
    logout

    login_button = @driver.find_element(:class, 'login')
    expect(login_button).to be_displayed
  end

  def test_log_in
    register_user
    logout
    login_user

    expect(@driver.find_element(:id, 'loggedas').text).not_to be_nil
  end

  def test_lost_password
    register_user
    logout
    lost_password

    flash_notice = @driver.find_element(:id, 'flash_notice')
    expect(flash_notice).to be_displayed
  end

  def test_create_project
    register_user
    add_new_project

    flash_notice = @driver.find_element(:id, 'flash_notice')
    expect(flash_notice).to be_displayed
  end

  def test_add_another_user
    register_user
    logout
    register_user1
    add_new_project
    add_another_user

    flash_notice = @driver.find_element(:id, 'flash_notice')
    expect(flash_notice).to be_displayed
  end

  def test_edit_roles
    register_user
    logout
    register_user1
    add_new_project
    edit_roles(:manager,:developer, 'Developer')

    expected_text = 'Developer'
    actual_text = @type_issue[@index].text
    expect(actual_text).to eql expected_text
  end

  def test_create_project_version
    register_user
    add_new_project
    create_project_version

    flash_notice = @driver.find_element(:id, 'flash_notice')
    expect(flash_notice).to be_displayed
  end

  def test_feature_type_issue
    register_user
    add_new_project
    add_issue_subject
    switching_type_issue('Feature')

    expected_text = 'Feature'
    actual_text = @type_issue[@index].text
    expect(actual_text).to eql expected_text
  end

  def test_support_type_issue

    register_user
    add_new_project
    add_issue_subject
    switching_type_issue('Support')

    expected_text = 'Support'
    actual_text = @type_issue[@index].text
    expect(actual_text).to eql expected_text
  end

  def test_bug_type_issue

    register_user
    add_new_project
    add_issue_subject
    switching_type_issue('Bug')

    expected_text = 'Bug'
    actual_text = @type_issue[@index].text
    expect(actual_text).to eql expected_text
  end

  def test_create_or_not_bug_issue_whit_add_watcher
    register_user
    add_new_project
    add_or_not_bug_issue
    open_bug_issue
    add_new_issue_if_you_not_have
    add_an_watcher

    aggregate_failures do
     expect(@issue.map{|el| el.text}).to include(@bug_issue)
     expect(@classes_watch.map{|el| el.text}).to include('Olena Kanevska')
    end
  end

  def test_create_or_not_bug_issue_whith_rescue
    register_user
    add_new_project
    add_or_not_bug_issue
    open_bug_issue

    begin
     raise NoBugIssueError, "You not create a bug issue. You can not click to bug issue." unless @my_bug_issue
     @my_bug_issue.click
     rescue NoBugIssueError => e
     puts e.inspect
     select_project
     add_new_issue
     puts "Now your create a new bug issue"
     open_bug_issue
     @my_bug_issue.click
    end

    issue = @driver.find_elements(:class,'subject')
    expect(issue.map(&:text)).to include @bug_issue
  end

  #def teardown
  #  @driver.quit
  #end

end
