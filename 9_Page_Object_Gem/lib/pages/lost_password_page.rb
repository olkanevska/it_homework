require_relative 'base_page'
class LostPasswordPage<BasePage

  text_field(:mail, id:'mail')

  def password_recovery (user)
    self.mail_element.when_present.send_keys user.email
    self.submit_form
  end
end