require_relative 'base_page'
class IssuesPage<BasePage

  def initialize(browser)
    @browser = browser
  end

  def open_my_page
    @browser.find_element(:class,'my-page').click
  end

  def open_add_watcher_dialog_title
    wait.until {@browser.find_element(:css,'#watchers .contextual').displayed?}
    @browser.find_element(:css,'#watchers .contextual').click
  end

  def open_icon_edit
    wait.until {@browser.find_element(css: 'a.icon.icon-edit').displayed?}
    @browser.find_element(css: 'a.icon.icon-edit').click
  end

  def add_watcher_dialog_title
    @browser.find_element(:css,'#users_for_watcher > label')
  end

  def my_watcher
    @browser.find_element(:css, '#users_for_watcher  input') # user.full_name
  end

  def click_submit_add_watcher_dialog_title
    @browser.find_element(:css,'.buttons [type="submit"]').click
  end

  def added_watcher_arr
    @browser.find_elements(:class,'watchers')
  end

  def added_watcher
    @browser.find_element(:class,'watchers')
  end

  def added_issue
    @browser.find_elements(:class,'subject')
  end

  def actual_type_issue
    @browser.find_element(:css,'ul.details > li:nth-child(1) > i:nth-child(3)'  )
  end

  def submit_edit_type_issue_form
    @browser.find_element(:css,'#issue-form > input:nth-child(7)')
  end

  def drop_down_types
    @browser.find_element(:id,'issue_tracker_id')
  end


  def add_watcher
    open_add_watcher_dialog_title
    wait.until {add_watcher_dialog_title.displayed?}
    my_watcher.click
    click_submit_add_watcher_dialog_title
    wait.until {added_watcher.displayed?}
  end

  def edit_type_issue_to (type)
    option(drop_down_types).select_by(:text, type)
    submit_edit_type_issue_form.click
    wait.until {actual_type_issue.displayed?}
  end

end


