require 'test/unit'
require 'selenium-webdriver'
require_relative 'our_module'
require_relative 'no_bug_issue_error'


class TestPositive < Test::Unit::TestCase
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

  def test_feature_types_issue
    register_user
    add_new_project

    @driver.find_element(:class,'new-issue').click
    @wait.until {@driver.find_element(:id,'issue_tracker_id').displayed?}

    @driver.find_element(:id, 'issue_subject').send_keys 'Exhaustive testing is impossible'

    @driver.find_element(:name,'issue[status_id]').click

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

  def test_support_types_issue

    register_user
    add_new_project

    @driver.find_element(:class,'new-issue').click
    @wait.until {@driver.find_element(:id,'issue_tracker_id').displayed?}

    @driver.find_element(:id, 'issue_subject').send_keys 'Exhaustive testing is impossible'

    @driver.find_element(:name,'issue[status_id]').click

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

  def test_bug_types_issue

    register_user
    add_new_project

    @driver.find_element(:class,'new-issue').click
    @wait.until {@driver.find_element(:id,'issue_tracker_id').displayed?}

    @driver.find_element(:id, 'issue_subject').send_keys 'Exhaustive testing is impossible'

    @driver.find_element(:name,'issue[status_id]').click

    @driver.find_element(:name,'continue').click

    @driver.find_element(:class,'issues').click

    @wait.until {@driver.find_elements(:css, '.tracker').first.displayed?}

    type_issue = @driver.find_elements(:css, '.tracker')

    index = type_issue.index {|chbx| chbx.text == 'Bug' }

    expected_text = 'Bug'
    actual_text = type_issue[index].text
    assert_equal(expected_text, actual_text)
  end

  def test_create_or_not_bug_issue_whit_watcher

    register_user
    add_new_project

    x = rand(1..2)
    if x == 1
    add_new_issue
    puts "Your random action: create a new bug issue"
    else
    puts "Your random action: not create a new bug issue"
    end

    @driver.find_element(:class,'my-page').click
    @wait.until {@driver.find_element(:class,'mypage-box').displayed?}

    classes_els = @driver.find_elements(:css,'.subject > a')
    my_bug_issue = classes_els.find {|el| el.text.include? @bug_issue}
    if my_bug_issue
      my_bug_issue.click
    else
      drop_down_project = @driver.find_element(:id,'project_quick_jump_box')
      option = Selenium::WebDriver::Support::Select.new(drop_down_project)
      option.select_by(:text, @project_name)
      add_new_issue
    end

    @wait.until {@driver.find_element(:class,'contextual').displayed?}
    @driver.find_element(:class,'contextual').click

    @wait.until {@driver.find_element(:id,'ui-id-3').displayed?}
    watcher = @driver.find_elements(:css,'#users_for_watcher > label')
    my_watcher = watcher.find {|el| el.text.include? 'Olena Kanevska'}
    my_watcher.click
    @driver.find_element(:css,'.buttons>input[type="submit"]').click

    issue = @driver.find_elements(:class,'subject')
    classes_watch = @driver.find_elements(:class,'watchers')
    assert issue.find {|el| el.text.include? @bug_issue} && classes_watch.find {|el| el.text.include? 'Olena Kanevska'}
  end
  def test_rescue_if_not_create_bug_issue
    register_user
    add_new_project

    x = rand(1..2)
    if x == 1
      add_new_issue
     puts "Your random action: create a new bug issue"
    else
      puts "Your random action: not create a new bug issue"
    end
    open_bug_issue
    raise NoBugIssueError, "You not create a bug issue. You can not click to bug issue." unless @my_bug_issue
    
    @my_bug_issue.click
  rescue NoBugIssueError => e
    puts e.inspect

    drop_down_project = @driver.find_element(:id,'project_quick_jump_box')
    option = Selenium::WebDriver::Support::Select.new(drop_down_project)
    option.select_by(:text, @project_name)
    puts "Now your create a new bug issue"
    add_new_issue
    open_bug_issue
    @my_bug_issue.click   

    issue = @driver.find_elements(:class,'subject')

    assert issue.find{|el| el.text.include? @bug_issue}
  end

  def teardown
    @driver.quit
  end

end
