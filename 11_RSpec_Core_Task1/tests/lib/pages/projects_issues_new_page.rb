require_relative 'base_page'
class ProjectsIssuesNewPage<BasePage

  text_field(:issue_subject, id:'issue_subject')
  select_list(:issue_type, name:'issue[tracker_id]')

  def create_issue(issue_type="Bug")
    @bug_issue = ('issue' + rand(999999).to_s)
    self.issue_type = issue_type
    self.issue_subject_element.when_visible.send_keys @bug_issue
    self.submit_form
    @bug_issue
  end

end