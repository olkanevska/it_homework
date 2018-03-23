require_relative 'base_page'
class ProjectsPage<BasePage

  def initialize(browser)
    @browser = browser
  end

  def open_projects_new_page
    wait.until {@browser.find_element(:css,'.icon.icon-add').displayed?}
    @browser.find_element(:css,'.icon.icon-add').click
  end

end
