require_relative 'base_page'
class ProjectsVersionsPage<BasePage

 link(:projects_versions,css:"#tab-content-versions a.icon-add")

  def open_projects_version
    self.projects_versions?
    self.projects_versions
  end
end