Before do
  @driver = Selenium::WebDriver.for :firefox
  @wait = Selenium::WebDriver::Wait.new(:timeout => 30)
end

After do
  @driver.quit
end