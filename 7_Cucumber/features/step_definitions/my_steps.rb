

Given(/^I am on Login page$/) do
  @wait.until {@driver.find_element(:class,'login').displayed?}
  @driver.find_element(:class,'login').click
end

Given(/^I am on Registration page$/) do
  @driver.navigate.to 'http://demo.redmine.org/account/register'
end

And(/^I do random actions create or not bug issue$/) do
  x = rand(1..2)

  if x == 1
    add_new_issue

    puts "Your random action: create a new bug issue"
  else
    puts "Your random action: not create a new bug issue"
  end
end

When(/^I submit valid credentials$/) do
  login_user
end

When(/^I submit registration form with valid data$/) do
  register_user
end

When(/^I'm log out$/) do
  @wait.until {@driver.find_element(:class,'logout').displayed?}
  @driver.find_element(:class, 'logout').click
end

When(/^I restore the password$/) do
  @wait.until {@driver.find_element(:css, '#login-form td a').displayed?}
  @driver.find_element(:css, '#login-form td a').click

  @wait.until {@driver.find_element(:id, 'mail').displayed?}
  @driver.find_element(:id, 'mail').send_keys (@login + '@gmail.com')

  @driver.find_element(:name, 'commit').click
end

When(/^I create project$/) do
  create_project
end

When(/^I create project version$/) do
  create_project_version
end


And(/^I add to my project another user$/) do
  add_user_in_project
end

When(/^I edit my role from: (.*) to: (.*)$/) do  |role_ex,role_new|
  edit_role_in_project(role_ex, role_new)
end

When(/^I edit feature type issue to: (.*)$/) do |type|
  @driver.find_element(:class,'new-issue').click
  @wait.until {@driver.find_element(:id,'issue_tracker_id').displayed?}

  @driver.find_element(:id, 'issue_subject').send_keys 'Exhaustive testing is impossible'

  @driver.find_element(:name,'issue[status_id]').click
  drop_down_types = @driver.find_element(:id,'issue_tracker_id')
  @option = Selenium::WebDriver::Support::Select.new(drop_down_types)

  @option.select_by(:text, type)

  @driver.find_element(:name,'continue').click

  @driver.find_element(:class,'issues').click

  @wait.until {@driver.find_elements(:css, '.tracker').first.displayed?}
end

Then(/^I am logged in$/) do
  @wait.until {@driver.find_element(:css, '#loggedas .user').displayed?}
  current_login = @driver.find_element(:css, '#loggedas .user').text
  expect(current_login). to eql @login
end

Then(/^I'm logged out$/) do
  @wait.until {@driver.find_element(:class,'login').displayed?}
  login_button = @driver.find_element(:class, 'login')
  expect(login_button).to be_displayed
end

Then(/^I see expected message$/) do
  @wait.until {@driver.find_element(:id,'flash_notice').displayed?}
  flash_notice = @driver.find_element(:id, 'flash_notice')
  expect(flash_notice).to be_displayed
end

Then(/^I edited my role in my project for a: (.*)$/) do |role|
  type_issue = @driver.find_elements(:class, 'roles')

  index = type_issue.index {|chbx| chbx.text == role}

  expected_text = role
  actual_text = type_issue[index].text
  expect(actual_text).to eql expected_text
end

Then(/^I edited feature type issue in my project for a: (.*)$/) do |type|
  type_issue = @driver.find_elements(:css, '.tracker')

  index = type_issue.index {|chbx| chbx.text == type}

  expected_text = type
  actual_text = type_issue[index].text
  expect(actual_text).to eql expected_text
end


When(/^I open bug issue or create new if I did not create it before$/) do
  open_bug_issue
  add_new_issue_if_you_not_have
end

And(/^I add watcher to my new bug issue$/) do
  add_an_watcher
end

Then(/^I created new bug issue$/) do
  @issue = @driver.find_elements(:class,'subject')
  expect(@issue.map{|el| el.text}).to include(@bug_issue)
end

And(/^I added watcher$/) do
  expect(@classes_watch.map{|el| el.text}).to include('Olena Kanevska')
end


And(/^I open bug issue or see error message if I did not create it before\. I create new issue\.$/) do
  open_bug_issue
  begin
    raise NoBugIssueError, "You not create a bug issue. You can not click to bug issue." unless @my_bug_issue
    @my_bug_issue.click
  rescue NoBugIssueError => e
    puts e.inspect
    drop_down_project = @driver.find_element(:id,'project_quick_jump_box')
    option = Selenium::WebDriver::Support::Select.new(drop_down_project)
    option.select_by(:text, @project_name)
    add_new_issue
    puts "Now your create a new bug issue"
    open_bug_issue
    @my_bug_issue.click
  end
end