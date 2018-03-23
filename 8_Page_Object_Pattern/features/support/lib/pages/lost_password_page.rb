require_relative 'base_page'
class LostPasswordPage<BasePage

  def initialize(browser)
    @browser = browser
  end

  def mail_txt
    @browser.find_element(:id, 'mail')
  end

  def password_recovery (user)
    wait.until {mail_txt.displayed?}
    mail_txt.send_keys user.email
    submit_form.click
  end
end