require_relative 'base_page'
class RegistrationPage<BasePage

  page_url "http://demo.redmine.org/account/register"

  text_field(:login, id:'user_login')

  text_field(:password, id:'user_password')

  text_field(:password_confirmation, id:'user_password_confirmation')

  text_field(:user_first_name, id:'user_firstname')

  text_field(:user_last_name, id:'user_lastname')

  text_field(:user_mail, id:'user_mail')

  def fill_in_registration_form( user)
    self.login = user.login
    self.password = user.password
    self.password_confirmation = user.password
    self.user_first_name = user.first_name
    self.user_last_name = user.last_name
    self.user_mail = user.email
    self.submit_form
  end
end