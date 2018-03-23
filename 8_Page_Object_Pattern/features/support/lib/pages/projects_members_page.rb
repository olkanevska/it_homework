require_relative 'base_page'
class ProjectsMembersPage<BasePage

  def initialize(browser)
    @browser = browser
  end

  def pagination
    @browser.find_element(:class,'pagination')
  end

  def member_choice
    @browser.find_element(:css,'#principals input')
  end

  def roles_chbxs
    @browser.find_elements(:css, '.roles-selection input')
  end

  def member_add_submit
    @browser.find_element(:id,'member-add-submit')
  end

  def member_dialog_title
    @browser.find_element(:css,'.icon.icon-add')
  end

  def open_chbxs_edit_roles
    @browser.find_element(:css, 'a.icon.icon-edit').click
  end

  def chbxs_edit_roles
    @browser.find_elements(:css, '*[name="membership[role_ids][]"]')
  end

  def submit_chbxs_edit_roles
    @browser.find_element(:css, 'input.small[name=commit]')
  end

  def actual_member_role
     @browser.find_element(:css,'.roles span')
  end

  def edit_role(role_ex, role_new)
    @roles = {manager: "3", developer: "4", reporter: "5"}
    index_ex = chbxs_edit_roles.index {|chbx| chbx.attribute("value")== @roles[role_ex.to_sym]}
    chbxs_edit_roles[index_ex].click
    index_act = chbxs_edit_roles.index {|chbx| chbx.attribute("value")== @roles[role_new.to_sym]}
    chbxs_edit_roles[index_act].click
    submit_chbxs_edit_roles.click
    wait.until{actual_member_role.displayed?}
  end

  def roles_selection_reporter
    @roles = {manager: "3", developer: "4", reporter: "5"}
    index = roles_chbxs.index {|chbx| chbx.attribute("value")== @roles[:reporter]}
    roles_chbxs[index].click
  end

  def add_new_member
    wait.until{member_dialog_title.displayed?}
    member_dialog_title.click
    wait.until{pagination.displayed?}
    member_choice.click
    roles_selection_reporter
    member_add_submit.click
    @page = ProjectsMembersPage.new(@browser)
  end

end