require_relative 'base_page'
class MyPage<BasePage
  page_url'http://demo.redmine.org/my'

  select_list(:project, id:'project_quick_jump_box')

  div(:created_tasks, id:'list-right')

  links(:classes, css:'.subject > a')

  cell( :actual_type_issue, class:'tracker')

  def find_my_issue(bug_issue)
    self.classes_elements.find{|el| el.text.include? bug_issue}
  end
end