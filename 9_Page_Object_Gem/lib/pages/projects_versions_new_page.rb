require_relative 'base_page'
class ProjectsVersionsNewPage<BasePage

  text_field(:version_name,id:'version_name')

  def create_new_version
    self.version_name?
    @name_version = ('version' + rand(999999).to_s)
    self.version_name = @name_version
    self.submit_form
  end
end