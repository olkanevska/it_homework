
class ProjectsNewPage<BasePage

  def initialize(browser)
    @browser = browser
  end

  def project_name_txt
    @browser.find_element(:id,'project_name')
  end

  def create_project
    wait.until {project_name_txt.displayed?}
    @project_name = ('project name' + rand(999999).to_s)
    project_name_txt.send_keys @project_name
    submit_form.click
    @page = ProjectsSettingsPage.new(@browser)
    @project_name
  end

end