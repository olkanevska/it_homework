require_relative 'base_page'
class LoginPage<BasePage

  text_field(:login_txt, id:'username')
  text_field(:password, id:'password')
  button(:submit_login_form, name:'login')
  link(:lost_password, css:'#login-form td a')

  def login
    self.login_txt_element.when_visible
    user = JSON.parse(File.read('tmp/user.json'))
    self.login_txt = self.user_login
    self.password =  user["password"]
    self.submit_login_form
  end
end




