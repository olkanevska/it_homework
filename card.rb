require 'faker'
require_relative 'comment'
class Card

  attr_reader :card_title,:current_list,:author,:comments,:content
  def initialize (card_title,list,user)
    @card_title = card_title
    @current_list = list
    @author = user
    @comments = []
    @content = ""
  end

  def add_content
    puts "Enter here what you want to see on your card #{@card_title}, if you want to leave the card without information, press Enter. "
    content = gets.chomp
    @content += "\n" + content
  end

  def add_comment(user)
    comment = Comment.new(user)
    @comments << comment
    comment
  end

  def remove_comment(comment)
    @comments.delete(comment)
    @comments
  end

  def to_s
    string =  "\n'#{@card_title}'."
    string << "\nContent:#{@content}\n"
  end
end