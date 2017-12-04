module OurModule
  def register_user
    @driver.navigate.to 'http://demo.redmine.org'
    @driver.find_element(:class, 'register').click

    @wait.until {@driver.find_element(:id,'user_login').displayed?}

    @login = ('login' + rand(999999).to_s)

    @driver.find_element(:id, 'user_login').send_keys @login
    @driver.find_element(:id, 'user_password').send_keys '1234567890'
    @driver.find_element(:id, 'user_password_confirmation').send_keys '1234567890'
    @driver.find_element(:id, 'user_firstname').send_keys 'Olena'
    @driver.find_element(:id, 'user_lastname').send_keys 'Kanevska'
    @driver.find_element(:id, 'user_mail').send_keys (@login + '@gmail.com')

    @driver.find_element(:name, 'commit').click
    @wait.until {@driver.find_element(:id,'flash_notice').displayed?}
  end

  def register_user1
    @driver.navigate.to 'http://demo.redmine.org'
    @driver.find_element(:class, 'register').click

    @wait.until {@driver.find_element(:id,'user_login').displayed?}

    @login1 = ('login' + rand(999999).to_s)

    @driver.find_element(:id, 'user_login').send_keys @login1
    @driver.find_element(:id, 'user_password').send_keys '1234567890'
    @driver.find_element(:id, 'user_password_confirmation').send_keys '1234567890'
    @driver.find_element(:id, 'user_firstname').send_keys 'Olena'
    @driver.find_element(:id, 'user_lastname').send_keys 'Kanevska'
    @driver.find_element(:id, 'user_mail').send_keys (@login1 + '@gmail.com')

    @driver.find_element(:name, 'commit').click
    @wait.until {@driver.find_element(:id,'flash_notice').displayed?}
  end

  def login_user
    @driver.find_element(:id,'username').send_keys @login
    @driver.find_element(:id, 'password').send_keys '1234567890'
  end

  def add_new_project
    @wait.until {@driver.find_element(:class,'projects').displayed?}
    @driver.find_element(:class,'projects').click

    @wait.until {@driver.find_element(:css,'.icon.icon-add').displayed?}
    @driver.find_element(:css,'.icon.icon-add').click

    @wait.until {@driver.find_element(:id,'project_name').displayed?}

    @project_name = ('project name' + rand(999999).to_s)

    @driver.find_element(:id,'project_name').send_keys @project_name

    @driver.find_element(:name, 'commit').click

    @wait.until {@driver.find_element(:id,'flash_notice').displayed?}

  end

  def add_another_user
    @driver.find_element(:id, 'tab-members').click

    @wait.until {@driver.find_element(:css,'.icon.icon-add').displayed?}
    @driver.find_element(:css,'.icon.icon-add').click

    @wait.until {@driver.find_element(:id,'principal_search').displayed?}
    @driver.find_element(:id,'principal_search').send_keys @login

    @wait.until {@driver.find_element(:class,'pagination').text == '(1-1/1)'}
    @driver.find_element(:css,'#principals input').click

    roles_chbxs = @driver.find_elements(:css, '.roles-selection input')

    @roles = {manager: "3", developer: "4", reporter: "5"}

    index = roles_chbxs.index {|chbx| chbx.attribute("value")== @roles[:manager]}

    roles_chbxs[index].click

    @driver.find_element(:id,'member-add-submit').click

    @wait.until {@driver.find_element(:id,'flash_notice').displayed?}
  end

  def edit_roles
    @driver.find_element(:css, 'a.icon.icon-edit').click

    @wait.until {@driver.find_elements(:css, '*[name="membership[role_ids][]"]').first.displayed?}

    @roles = {manager: "3", developer: "4", reporter: "5"}

    roles_chbxs = @driver.find_elements(:css, '*[name="membership[role_ids][]"]')

    index = roles_chbxs.index {|chbx| chbx.attribute("value")== @roles[:manager] }

    roles_chbxs[index].click

    index1 = roles_chbxs.index {|chbx| chbx.attribute("value")== @roles[:developer] }

    roles_chbxs[index1].click

    @driver.find_element(:css, 'input.small[name=commit]').click

    @wait.until {@driver.find_element(:id,'flash_notice').displayed?}

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

  def add_new_issue

    @driver.find_element(:class,'new-issue').click
    @wait.until {@driver.find_element(:id,'issue_tracker_id').displayed?}

    @bug_issue = ('issue' + rand(999999).to_s)

    @driver.find_element(:id, 'issue_subject').send_keys @bug_issue

    @driver.find_element(:name,'commit').click

  end

  def lost_password

    @wait.until {@driver.find_element(:css, '#login-form td a').displayed?}
    @driver.find_element(:css, '#login-form td a').click

    @wait.until {@driver.find_element(:id, 'mail').displayed?}
    @driver.find_element(:id, 'mail').send_keys (@login + '@gmail.com')

    @driver.find_element(:name, 'commit').click

    @wait.until {@driver.find_element(:id,'flash_notice').displayed?}

  end

  def open_bug_issue
    @driver.find_element(:class,'my-page').click
    @wait.until {@driver.find_element(:class,'mypage-box').displayed?}

    classes_els = @driver.find_elements(:css,'.subject > a')
    @my_bug_issue = classes_els.find {|el| el.text.include? @bug_issue}
  end
  
end
