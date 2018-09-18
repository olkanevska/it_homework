require_relative 'base_page'
class MyAccountPage<BasePage

  link(:open_projects_page, class:'projects')

  link(:info_logged_user,css:'#loggedas a')
end