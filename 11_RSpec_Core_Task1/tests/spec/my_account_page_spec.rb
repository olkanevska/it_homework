
describe MyAccountPage do
  before do
   visit(RegistrationPage).login_element.when_visible
   @user = User.new
   on(RegistrationPage).fill_in_registration_form(@user)
   on(MyAccountPage).logout?
  end
 it 'log in' do
   expect(on(MyAccountPage).info_logged_user_element.text).to eql @user.login
 end
end

