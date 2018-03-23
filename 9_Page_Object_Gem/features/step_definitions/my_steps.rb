
Given(/^I am on Login page$/) do
@current_page.login
end

Given(/^I am on Registration page$/) do
visit(RegistrationPage).login_element.when_visible
end

And(/^I do random actions create or not bug issue$/) do
  x = rand(1..2)

  if x == 1
    on(ProjectsSettingsPage).open_issue_new
    puts "Your random action: create a new bug issue"
    #create_issue имеет аргумент type_issue можно выбрать "Feature", "Support" если не выбирать то по умолчанию будет "Bug"
    @bug_issue = on(ProjectsIssuesNewPage).create_issue
  else
    puts "Your random action: not create a new bug issue"
  end
end

When(/^I create bug issue$/) do
  on(ProjectsSettingsPage).open_issue_new
  #create_issue имеет аргумент type_issue можно выбрать "Feature", "Support" если не выбирать то по умолчанию будет "Bug"
  @bug_issue = on(ProjectsIssuesNewPage).create_issue
end

When(/^I submit valid credentials$/) do
  on(LoginPage).login(@user)
end

When(/^I submit registration form with valid data$/) do
  @user = User.new
  on(RegistrationPage).fill_in_registration_form(@user)
  on(MyAccountPage).logout?
end

When(/^I'm log out$/) do
  @current_page.logout
end

When(/^I restore the password$/) do
  on(LoginPage).lost_password_element.when_present
  @current_page.lost_password
  on(LostPasswordPage).password_recovery(@user)
end

When(/^I create project$/) do
  @current_page.open_projects_page
  on(ProjectsPage).open_new_project?
  @current_page.open_new_project
  @project_name = on(ProjectsNewPage).create_project
end

When(/^I create project version$/) do
  on(ProjectsSettingsPage).versions
  on(ProjectsVersionsPage).open_projects_version
  on(ProjectsVersionsNewPage).create_new_version
end

And(/^I add to my project another user$/) do
  on(ProjectsSettingsPage).members
  on(ProjectsMembersPage).add_new_member
end

When(/^I edit my role to: (.*)$/) do |role_new|
  on(ProjectsSettingsPage).members_element.when_present.click
  on(ProjectsMembersPage).edit_roles
  @current_page.manager?
  @current_page.edit_role(role_new)
end

When(/^I edit feature type issue to: (.*)$/) do |type|
  on(IssuesPage).open_icon_edit
  @current_page.edit_type_issue_to(type)
end

When(/^I open bug issue or create new if I did not create it before$/) do
  on(IssuesPage).open_my_page
  if on(MyPage).find_my_issue(@bug_issue)
    @current_page.find_my_issue(@bug_issue).click
  else
    @current_page.project=@project_name
    on(ProjectsSettingsPage).open_issue_new
    #create_issue имеет аргумент type_issue можно выбрать "Feature", "Support" если не выбирать то по умолчанию будет "Bug"
    @bug_issue = on(ProjectsIssuesNewPage).create_issue
  end
end

And(/^I add watcher to my new bug issue$/) do
  on(IssuesPage).add_watcher
end

Then(/^I am logged in$/) do
  expect(on(MyAccountPage).info_logged_user_element.text).to eql @user.login
end

Then(/^I'm logged out$/) do
  expect(on(HomePage).login_element).to be_visible
end

Then(/^I see expected message$/) do
  @current_page.expected_message?
  expect(@current_page.expected_message_element).to be_visible
end

Then(/^I edited my role in my project for a: (.*)$/) do |role|
  expect(on(ProjectsMembersPage).actual_member_role).to eql role
end

Then(/^I edited feature type issue in my project for a: (.*)$/) do |type|
  expect(visit(MyPage).actual_type_issue).to eql type
end

Then(/^I created new bug issue$/) do
  expect(on(IssuesPage).added_issue).to include(@bug_issue)
end

And(/^I added watcher$/) do
  expect(on(IssuesPage).added_watcher).to include(@user.full_name)
end


And(/^I open bug issue or see error message if I did not create it before\. I create new issue\.$/) do
  on(IssuesPage).open_my_page
  on(MyPage).find_my_issue(@bug_issue)
  begin
    raise NoBugIssueError, "You not create a bug issue. You can not click to bug issue." unless @current_page.find_my_issue(@bug_issue)
    @current_page.find_my_issue(@bug_issue).click
    rescue NoBugIssueError => e
    puts e.inspect
    @current_page.project=@project_name
    on(ProjectsSettingsPage).open_issue_new
    projects_issues_new_page = ProjectsIssuesNewPage.new(@browser)
    #create_issue имеет аргумент type_issue можно выбрать "Feature", "Support" если не выбирать то по умолчанию будет "Bug"
    @bug_issue = projects_issues_new_page.create_issue
    puts "Now your create a new bug issue"
  end
end