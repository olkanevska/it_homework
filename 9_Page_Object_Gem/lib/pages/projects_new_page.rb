
class ProjectsNewPage<BasePage

  text_field(:project_name, id:'project_name')

  def create_project
    @project_name = ('project name' + rand(999999).to_s)
    self.project_name_element.when_visible.send_keys @project_name
    self.submit_form
    @project_name
  end
end