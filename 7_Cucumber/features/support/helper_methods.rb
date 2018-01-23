module HelperMethods
  def register_user
    @wait.until {@driver.find_element(:id,'user_login').displayed?}
    @login = ('my_test_user' + rand(999999).to_s)
    form_registration = {user_login: @login,
                         user_password: '1234567890',
                         user_password_confirmation: '1234567890',
                         user_firstname: 'Olena',
                         user_lastname: 'Kanevska',
                         user_mail: (@login + '@gmail.com')}
    form_registration.each_pair do |key, value|
      @driver.find_element(:id,key).send_keys value
    end
    @driver.find_element(:name, 'commit').click
  end

  def login_user
    @wait.until {@driver.find_element(:id,'username').displayed?}
    form_login = {username: @login,
                  password:'1234567890'}
    form_login.each_pair do |key, value|
      @driver.find_element(:id,key).send_keys value
    end
    @driver.find_element(name: 'login').click
  end

  def create_project
    @wait.until {@driver.find_element(:class,'projects').displayed?}
    @driver.find_element(:class,'projects').click

    @wait.until {@driver.find_element(:css,'.icon.icon-add').displayed?}
    @driver.find_element(:css,'.icon.icon-add').click

    @wait.until {@driver.find_element(:id,'project_name').displayed?}

    @project_name = ('project name' + rand(999999).to_s)

    @driver.find_element(:id,'project_name').send_keys @project_name

    @driver.find_element(:name, 'commit').click

    @wait.until {@driver.find_element(:id, 'tab-members').displayed?}
  end

  def add_user_in_project
    @driver.find_element(:id, 'tab-members').click

    @wait.until {@driver.find_element(:css,'.icon.icon-add').displayed?}
    @driver.find_element(:css,'.icon.icon-add').click
    @wait.until {@driver.find_element(:class,'pagination')}
    @driver.find_element(:css,'#principals input').click

    roles_chbxs = @driver.find_elements(:css, '.roles-selection input')

    @roles = {manager: "3", developer: "4", reporter: "5"}

    index = roles_chbxs.index {|chbx| chbx.attribute("value")== @roles[:reporter]}

    roles_chbxs[index].click

    @driver.find_element(:id,'member-add-submit').click
  end

  def edit_role_in_project(role_ex,role_new)
    @driver.find_element(:id, 'tab-members').click
    @driver.find_element(:css, 'a.icon.icon-edit').click

    @wait.until {@driver.find_elements(:css, '*[name="membership[role_ids][]"]').first.displayed?}

    @roles = {manager: "3", developer: "4", reporter: "5"}

    roles_chbxs = @driver.find_elements(:css, '*[name="membership[role_ids][]"]')

    index_ex = roles_chbxs.index {|chbx| chbx.attribute("value")== @roles[role_ex.to_sym] }

    roles_chbxs[index_ex].click

    index_act = roles_chbxs.index {|chbx| chbx.attribute("value")== @roles[role_new.to_sym]}

    roles_chbxs[index_act].click

    @driver.find_element(:css, 'input.small[name=commit]').click

    @wait.until {@driver.find_element(:css,'.roles span').displayed?}
  end

  def create_project_version

    @driver.find_element(:id, 'tab-versions').click

    @wait.until {@driver.find_element(:css,'#tab-content-versions .icon-add').displayed?}
    @driver.find_element(:css,'#tab-content-versions .icon-add').click

    @wait.until {@driver.find_element(:id, 'version_name').displayed?}

    @name_version = ('version' + rand(999999).to_s)

    @driver.find_element(:id, 'version_name').send_keys @name_version

    @driver.find_element(:css, '[type=submit]').click

    @wait.until {@driver.find_element(:id,'flash_notice').displayed?}

  end

  def add_an_watcher
    @wait.until {@driver.find_element(:class,'contextual').displayed?}
    @driver.find_element(:class,'contextual').click

    @wait.until {@driver.find_element(:id,'ui-id-3').displayed?}
    watcher = @driver.find_elements(:css,'#users_for_watcher > label')
    my_watcher = watcher.find {|el| el.text.include? 'Olena Kanevska'}
    my_watcher.click
    @driver.find_element(:css,'.buttons>input[type="submit"]').click
    @wait.until {@driver.find_element(:class,'watchers').displayed?}

    @issue = @driver.find_elements(:class,'subject')
    @classes_watch = @driver.find_elements(:class,'watchers')
  end

  def open_bug_issue
    @driver.find_element(:class,'my-page').click
    @wait.until {@driver.find_element(:class,'mypage-box').displayed?}

    classes_els = @driver.find_elements(:css,'.subject > a')
    @my_bug_issue = classes_els.find {|el| el.text.include? @bug_issue}
  end

  def add_new_issue

    @driver.find_element(:class,'new-issue').click
    @wait.until {@driver.find_element(:id,'issue_tracker_id').displayed?}

    @bug_issue = ('issue' + rand(999999).to_s)

    @driver.find_element(:id, 'issue_subject').send_keys @bug_issue

    @driver.find_element(:name,'commit').click
  end

  def add_new_issue_if_you_not_have
    if @my_bug_issue
      @my_bug_issue.click
    else
      drop_down_project = @driver.find_element(:id,'project_quick_jump_box')
      option = Selenium::WebDriver::Support::Select.new(drop_down_project)
      option.select_by(:text, @project_name)
      add_new_issue
    end
  end

end