require 'test/unit'
require 'selenium-webdriver'
require_relative'our_module'

class TestRegistration < Test::Unit::TestCase
  include OurModule

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  end

  def test_positive
    register_user

    flash_notice = @driver.find_element(:id, 'flash_notice')
    assert(flash_notice.displayed?)
  end

  def test_log_out
    register_user

    @wait.until {@driver.find_element(:class,'logout').displayed?}
    @driver.find_element(:class, 'logout').click

    @wait.until {@driver.find_element(:class,'login').displayed?}

    login_button = @driver.find_element(:class, 'login')

    assert(login_button.displayed?)

  end

  def test_log_in
    register_user
    @wait.until {@driver.find_element(:class,'logout').displayed?}
    @driver.find_element(:class, 'logout').click

    @wait.until {@driver.find_element(:class,'login').displayed?}

    @driver.find_element(:class,'login').click

    @wait.until {@driver.find_element(:id,'username').displayed?}

    login_user

    @driver.find_element(:name,'login').click

    @wait.until {@driver.find_element(:class,'my-account').displayed?}
    account_button = @driver.find_element(:class,'my-account')

    assert(account_button.displayed?)
  end

  def test_lost_password
    register_user
    @wait.until {@driver.find_element(:class,'logout').displayed?}
    @driver.find_element(:class, 'logout').click

    @wait.until {@driver.find_element(:class,'login').displayed?}
    @driver.find_element(:class,'login').click

    lost_password

    flash_notice = @driver.find_element(:id, 'flash_notice')
    assert(flash_notice.displayed?)

  end

  def test_create_project
    register_user
    add_new_project

    flash_notice = @driver.find_element(:id, 'flash_notice')
    assert(flash_notice.displayed?)
  end

  def test_add_another_user
    register_user
    @wait.until {@driver.find_element(:class,'logout').displayed?}
    @driver.find_element(:class, 'logout').click
    @wait.until {@driver.find_element(:class,'login').displayed?}

    register_user1
    add_new_project
    add_another_user

    flash_notice = @driver.find_element(:id, 'flash_notice')
    assert(flash_notice.displayed?)

  end

  def test_edit_roles
    register_user
    @wait.until {@driver.find_element(:class,'logout').displayed?}
    @driver.find_element(:class, 'logout').click
    @wait.until {@driver.find_element(:class,'login').displayed?}

    register_user1
    add_new_project
    @driver.find_element(:id, 'tab-members').click
    edit_roles

    type_issue = @driver.find_elements(:class, 'roles')

    index = type_issue.index {|chbx| chbx.text == 'Developer'}

    expected_text = 'Developer'
    actual_text = type_issue[index].text
    assert_equal(expected_text, actual_text)

  end

  def test_create_project_version
    register_user
    add_new_project
    create_project_version

    flash_notice = @driver.find_element(:id, 'flash_notice')
    assert(flash_notice.displayed?)
  end

  def test_feature_types_isue
    register_user
    add_new_project
    add_new_issue

    drop_down_types = @driver.find_element(:id,'issue_tracker_id')
    option = Selenium::WebDriver::Support::Select.new(drop_down_types)
    option.select_by(:text, 'Feature')

    @driver.find_element(:name,'continue').click

    @driver.find_element(:class,'issues').click

    @wait.until {@driver.find_elements(:css, '.tracker').first.displayed?}

    type_issue = @driver.find_elements(:css, '.tracker')

    index = type_issue.index {|chbx| chbx.text == 'Feature'}

    expected_text = 'Feature'
    actual_text = type_issue[index].text
    assert_equal(expected_text, actual_text)

  end

  def test_support_types_isue

    register_user
    add_new_project
    add_new_issue

    drop_down_types = @driver.find_element(:id,'issue_tracker_id')
    option = Selenium::WebDriver::Support::Select.new(drop_down_types)
    option.select_by(:text, 'Support')

    @driver.find_element(:name,'continue').click

    @driver.find_element(:class,'issues').click

    @wait.until {@driver.find_elements(:css, '.tracker').first.displayed?}

    type_issue = @driver.find_elements(:css, '.tracker')

    index = type_issue.index {|chbx| chbx.text == 'Support'}

    expected_text = 'Support'
    actual_text = type_issue[index].text
    assert_equal(expected_text, actual_text)

  end

  def test_bug_types_isue

    register_user
    add_new_project

    @driver.find_element(:class,'new-issue').click
    @wait.until {@driver.find_element(:id,'issue_tracker_id').displayed?}

    add_new_issue

    @driver.find_element(:name,'commit').click

    @driver.find_element(:class,'issues').click

    @wait.until {@driver.find_elements(:css, '.tracker').first.displayed?}

    type_issue = @driver.find_elements(:css, '.tracker')

    index = type_issue.index {|chbx| chbx.text == 'Bug' }

    expected_text = 'Bug'
    actual_text = type_issue[index].text
    assert_equal(expected_text, actual_text)

  end

 #def teardown
 #   @driver.quit
 #end
end
