require_relative 'base_page'
class ProjectsVersionsPage<BasePage

  def initialize(browser)
    @browser = browser
  end

  def open_projects_versions_new_page
    wait.until {@browser.find_element(:css,'#tab-content-versions .icon-add').displayed?}
    @browser.find_element(:css,'#tab-content-versions .icon-add').click
  end

end