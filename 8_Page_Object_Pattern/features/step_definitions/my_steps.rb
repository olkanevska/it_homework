
Given(/^I am on Login page$/) do
 home_page = HomePage.new(@browser)
 home_page.open_login_page
end

Given(/^I am on Registration page$/) do
  registration_page = RegistrationPage.new(@browser)
  registration_page.open
end

And(/^I do random actions create or not bug issue$/) do
  x = rand(1..2)

  if x == 1
    projects_settings_page = ProjectsSettingsPage.new(@browser)
    projects_settings_page.open_projects_issues_new_page
    projects_issues_new_page = ProjectsIssuesNewPage.new(@browser)
    puts "Your random action: create a new bug issue"
    @bug_issue = projects_issues_new_page.create_issue
  else
    puts "Your random action: not create a new bug issue"
  end
end

When(/^I create bug issue$/) do
  projects_settings_page = ProjectsSettingsPage.new(@browser)
  projects_settings_page.open_projects_issues_new_page
  projects_issues_new_page = ProjectsIssuesNewPage.new(@browser)
  @bug_issue = projects_issues_new_page.create_issue
end

When(/^I submit valid credentials$/) do
  login_page = LoginPage.new(@browser)
  login_page.login(@user)
end

When(/^I submit registration form with valid data$/) do
  @user = User.new
  registration_page = RegistrationPage.new(@browser)
  @page = registration_page.fill_in_registration_form(@user)
end

When(/^I'm log out$/) do
  my_account_page = LoginPage.new(@browser)
  my_account_page.logout
end

When(/^I restore the password$/) do
  login_page = LoginPage.new(@browser)
  login_page.open_lost_password_page
  lost_password_page = LostPasswordPage.new(@browser)
  lost_password_page.password_recovery(@user)
end

When(/^I create project$/) do
  my_account_page = MyAccountPage.new(@browser)
  my_account_page.open_projects_page
  projects_page = ProjectsPage.new(@browser)
  projects_page.open_projects_new_page
  projects_new_page = ProjectsNewPage.new(@browser)
  @project_name = projects_new_page.create_project
end

When(/^I create project version$/) do
  projects_settings_page = ProjectsSettingsPage.new(@browser)
  projects_settings_page.open_projects_versions_page
  projects_versions_page = ProjectsVersionsPage.new(@browser)
  projects_versions_page.open_projects_versions_new_page
  projects_versions_new_page = ProjectsVersionsNewPage.new(@browser)
  projects_versions_new_page.create_new_version
end

And(/^I add to my project another user$/) do
  projects_settings_page = ProjectsSettingsPage.new(@browser)
  projects_settings_page.open_projects_members_page
  projects_members_page = ProjectsMembersPage.new(@browser)
  projects_members_page.add_new_member
end

When(/^I edit my role from: (.*) to: (.*)$/) do  |role_ex,role_new|
  projects_settings_page = ProjectsSettingsPage.new(@browser)
  projects_settings_page.open_projects_members_page
  projects_members_page = ProjectsMembersPage.new(@browser)
  projects_members_page.open_chbxs_edit_roles
  projects_members_page.wait.until{projects_members_page.chbxs_edit_roles}.first.displayed?
  projects_members_page.edit_role(role_ex, role_new)
end

When(/^I edit feature type issue to: (.*)$/) do |type|
  issues_page = IssuesPage.new(@browser)
  issues_page.open_icon_edit
  issues_page.edit_type_issue_to(type)
end

When(/^I open bug issue or create new if I did not create it before$/) do
  issues_page = IssuesPage.new(@browser)
  issues_page.open_my_page
  my_page = MyPage.new(@browser)
  if my_page.find_my_issue(@bug_issue)
    my_page.find_my_issue(@bug_issue).click
  else
   my_page.select_my_project(@project_name)
   projects_settings_page = ProjectsSettingsPage.new(@browser)
   projects_settings_page.open_projects_issues_new_page
   projects_issues_new_page = ProjectsIssuesNewPage.new(@browser)
   @bug_issue = projects_issues_new_page.create_issue
  end
end

And(/^I add watcher to my new bug issue$/) do
  issues_page = IssuesPage.new(@browser)
  issues_page.add_watcher
end

Then(/^I am logged in$/) do
  home_page = HomePage.new(@browser)
  expect(home_page.info_logged_user_btn).eql? @user.login
end

Then(/^I'm logged out$/) do
  home_page = HomePage.new(@browser)
  home_page.wait.until {home_page.open_login_page_btn.displayed?}
  expect(home_page.open_login_page_btn).to be_displayed
end

Then(/^I see expected message$/) do
  @page.wait.until {@page.expected_message.displayed?}
  expect(@page.expected_message).to be_displayed
end

Then(/^I edited my role in my project for a: (.*)$/) do |role|
  projects_members_page = ProjectsMembersPage.new(@browser)
  expected_role = role
  expect(projects_members_page.actual_member_role.text).to eql expected_role
end

Then(/^I edited feature type issue in my project for a: (.*)$/) do |type|
  issues_page = IssuesPage.new(@browser)
  actual_type_issue = issues_page.actual_type_issue.text
  expected_type_issue = type
end

Then(/^I created new bug issue$/) do
  issues_page = IssuesPage.new(@browser)
  issues_page.added_issue
  expect(issues_page.added_issue.map{|el| el.text}).to include(@bug_issue)
end

And(/^I added watcher$/) do
  issues_page = IssuesPage.new(@browser)
  expect(issues_page.added_watcher_arr.map{|el| el.text}).to include(@user.full_name)
end


And(/^I open bug issue or see error message if I did not create it before\. I create new issue\.$/) do
  issues_page = IssuesPage.new(@browser)
  issues_page.open_my_page
  my_page = MyPage.new(@browser)
  my_page.find_my_issue(@bug_issue)
  begin
    raise NoBugIssueError, "You not create a bug issue. You can not click to bug issue." unless my_page.find_my_issue(@bug_issue)
    my_page.find_my_issue(@bug_issue).click
    rescue NoBugIssueError => e
    puts e.inspect
    my_page.select_my_project(@project_name)
    projects_settings_page = ProjectsSettingsPage.new(@browser)
    projects_settings_page.open_projects_issues_new_page
    projects_issues_new_page = ProjectsIssuesNewPage.new(@browser)
    @bug_issue = projects_issues_new_page.create_issue
    puts "Now your create a new bug issue"
  end
 end