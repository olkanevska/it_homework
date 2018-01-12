require 'faker'
require_relative 'user'
class Comment

  attr_reader :author,:text
  def initialize(user)
    @author = user
    @text = Faker::Simpsons.quote
  end

  def to_s
    string = "comment: #{@text}\n"
    string << "author of the comment: #{@author}"
  end

end