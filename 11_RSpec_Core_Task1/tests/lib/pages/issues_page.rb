require_relative 'base_page'
class IssuesPage<BasePage

 link(:open_my_page, class:'my-page')
 div(:open_add_watcher, css:'#watchers .contextual')
 label(:watcher_full_name, css:'#users_for_watcher > label')
 div(:added_issue, class:'subject')
 link(:icon_edit, class:'icon icon-edit' )
 button(:submit_add_watcher,css:'.buttons > input')
 unordered_list(:added_watcher, class: 'watchers')
 select_list(:issue_tracker, id:'issue_tracker_id')
 button(:submit_edit_type_issue,css:'#issue-form [name="commit"]')
 div(:history,id:'history')
 #unordered_list(:actual_type_issue,css:'.details > li:nth-child(1) > i:nth-child(3)')

  def open_icon_edit
    self.icon_edit_element.when_present
    self.icon_edit
  end

  def add_watcher
    self.open_add_watcher_element.click
    self.watcher_full_name_element.click
    self.submit_add_watcher
    self.added_watcher_element.when_present
  end

  def edit_type_issue_to (type)
    self.issue_tracker = type
    self.submit_edit_type_issue
  end
end


