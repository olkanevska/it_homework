require_relative 'base_page'
class ProjectsSettingsPage<BasePage

  def initialize(browser)
    @browser = browser
  end

  def open_projects_members_page
    wait.until {@browser.find_element(:id, 'tab-members').displayed?}
    @browser.find_element(:id, 'tab-members').click
  end

  def open_projects_versions_page
    @browser.find_element(:id, 'tab-versions').click
  end

  def open_projects_issues_new_page
    @browser.find_element(:class,'new-issue').click
  end

end