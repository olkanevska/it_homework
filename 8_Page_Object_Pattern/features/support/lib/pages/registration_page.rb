require_relative 'base_page'
class RegistrationPage<BasePage

  def initialize(browser)
    @browser = browser
  end

  def login_txt
    @browser.find_element(id:'user_login')
  end

  def password_txt
    @browser.find_element(id:'user_password')
  end

  def password_confirmation_txt
    @browser.find_element(id:'user_password_confirmation')
  end

  def user_first_name_txt
    @browser.find_element(id:'user_firstname')
  end

  def user_last_name_txt
    @browser.find_element(id:'user_lastname')
  end

  def user_mail_txt
    @browser.find_element(id:'user_mail')
  end

  def open
    @browser.navigate.to 'http://demo.redmine.org/account/register'
    wait.until {login_txt.displayed?}
  end

  def fill_in_registration_form( user)
    login_txt.send_keys user.login
    password_txt.send_keys user.password
    password_confirmation_txt.send_keys user.password
    user_first_name_txt.send_keys user.first_name
    user_last_name_txt.send_keys user.last_name
    user_mail_txt.send_keys user.email
    submit_form.click
    @page = MyAccountPage.new(@browser)
  end

end