require_relative 'base_page'
class ProjectsIssuesNewPage<BasePage

  def initialize(browser)
    @browser = browser
  end

  def issue_subject_txt
    @browser.find_element(:id, 'issue_subject')
  end

  def create_issue
    wait.until {issue_subject_txt.displayed?}
    @bug_issue = ('issue' + rand(999999).to_s)
    issue_subject_txt.send_keys @bug_issue
    submit_form.click
    @bug_issue
  end

end