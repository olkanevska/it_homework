require_relative 'base_page'
class ProjectsVersionsNewPage<BasePage

  def initialize(browser)
    @browser = browser
  end

  def version_name_txt
    @browser.find_element(:id, 'version_name')
  end

  def create_new_version
    wait.until {version_name_txt.displayed?}
    @name_version = ('version' + rand(999999).to_s)
    version_name_txt.send_keys @name_version
    submit_form.click
    @page = ProjectsVersionsPage.new(@browser)
  end

end