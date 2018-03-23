class BasePage

 def wait
  Selenium::WebDriver::Wait.new(:timeout => 30)
 end

 def option (drop_down)
  Selenium::WebDriver::Support::Select.new(drop_down)
 end
 def open_login_page_btn
  @browser.find_element(:class,'login')
 end

 def open_login_page
  wait.until {open_login_page_btn.displayed?}
  open_login_page_btn.click
 end

 def logout
   wait.until {@browser.find_element(:class,'logout').displayed?}
   @browser.find_element(:class, 'logout').click
 end

 def info_logged_user_btn
   @browser.find_element(:css,'#loggedas a')
 end

  def expected_message
   @browser.find_element(:id,'flash_notice')
  end

 def submit_form
   @browser.find_element(:name, 'commit')
 end

end