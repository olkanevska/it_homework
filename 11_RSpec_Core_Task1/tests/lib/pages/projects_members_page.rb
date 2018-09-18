require_relative 'base_page'
class ProjectsMembersPage<BasePage

 link(:edit_roles, class:'icon-edit')
 checkbox(:manager, css:'[name="membership[role_ids][]"][value="3"]')
 checkbox(:developer, css:'[name="membership[role_ids][]"][value="4"]')
 button(:submit,css:'.small[name="commit"]')
 span(:actual_member_role,css:'.roles span')
 paragraph(:pagination, class: 'pangination')
 checkbox(:member, css: '#principals input')
 checkbox(:reporter, css:'div .roles-selection label [value="5"]')
 button(:submit_member_choice,id:'member-add-submit')
 link(:new_member, css:"div #tab-content-members p a.icon-add")

 def edit_role(role_new)
   self.uncheck_manager
   self.send("check_#{role_new}")
   self.submit
   self.submit_element.when_not_present
 end

 def add_new_member
   self.new_member?
   self.new_member
   self.pagination?
   self.check_member
   self.check_reporter
   self.submit_member_choice
 end
end