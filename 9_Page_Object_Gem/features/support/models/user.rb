class User
  include PageObject
  attr_reader :first_name, :last_name, :email, :login, :password, :full_name

  def initialize
    @first_name = Faker::Name.first_name
    @last_name = Faker::Name.last_name
    @email = Faker::Internet.email(@first_name + @last_name)
    @login = (@first_name + @last_name + rand(999999).to_s)
    @full_name = (@first_name +' '+ @last_name)
    @password = Faker::Internet.password
  end
end
