require_relative 'base_page'
class MyAccountPage<BasePage

  def initialize(browser)
    @browser = browser
  end

  def open_projects_page
   wait.until {@browser.find_element(:class,'projects').displayed?}
   @browser.find_element(:class,'projects').click
  end
end