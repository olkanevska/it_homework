require_relative 'base_page'
class MyPage<BasePage

  def initialize(browser)
    @browser = browser
  end

  def drop_down_project
    @browser.find_element(:id,'project_quick_jump_box')
  end

  def issue_subject
    @browser.find_element(:class,'mypage-box')
  end

  def classes_els
    @browser.find_elements(:css,'.subject > a')
  end

  def find_my_issue(bug_issue)
    wait.until {issue_subject.displayed?}
    classes_els.find{|el| el.text.include? bug_issue}
  end

  def select_my_project(project_name)
    option(drop_down_project).select_by(:text, project_name)
  end

end