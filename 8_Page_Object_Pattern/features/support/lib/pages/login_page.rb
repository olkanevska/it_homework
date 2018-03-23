require_relative 'base_page'
class LoginPage<BasePage

  def initialize(browser)
    @browser = browser
  end

  def login_txt
    @browser.find_element(id: 'username')
  end

  def password_txt
    @browser.find_element(id: 'password')
  end

  def submit_login_form
    @browser.find_element(name: 'login')
  end

  def login (user)
    wait.until {login_txt.displayed?}
    login_txt.send_keys user.login
    password_txt.send_keys user.password
    submit_login_form.click
    @page = LoginPage.new(@browser)
  end

  def open_lost_password_page
    wait.until {@browser.find_element(:css, '#login-form td a').displayed?}
    @browser.find_element(:css, '#login-form td a').click
  end

end




