
require 'faker'
require_relative 'board'
class User
  attr_reader :name, :boards, :email
  def initialize
    @first_name = Faker::Name.first_name
    @last_name = Faker::Name.last_name
    @email = Faker::Internet.email(@first_name + @last_name)
    @name = @first_name + ' ' + @last_name
    @boards = []
  end

  def add_board(board_name)
    board = Board.new(board_name)
    @boards<<board
    puts "\nUser #{self.name}, created the board: '#{board_name}'.\n"
    board
  end

  def info_user_boards
    puts "\nNow the user #{@name} has #{@boards.length} board(s):\n"
    @boards.each {|board| puts board}
  end

  def rename_board(board, new_name)
    puts "\nUser #{self.name} renamed his board '#{board.board_name}' in '#{new_name}'.\n"
    board.rename(new_name)
  end

  def add_list(board,list_title)
    puts "\nUser #{self.name}, created the list: '#{list_title}'.\n"
     board.add_list(list_title)
  end

  def info_user_lists
    user_lists = []
    @boards.each {|board| user_lists += board.lists}
    puts "\nNow the user #{@name} has #{user_lists.length} list(s):"
    user_lists.each {|list| puts list}
  end

  def add_card(card_title,list)
    puts "\nUser #{self.name}, created the card: '#{card_title}'.\n\n"
    list.add_card(card_title,list,self)
  end

  def remove_list(list)
    puts"\nUser #{self.name} removed the list '#{list.list_title}' from the board '#{list.board.board_name}'"
    list.board.lists.delete(list)
  end

  def info_card_on_list(list)
    list.info_card(self)
  end

  def remove_card(list, card)
    puts"\nUser #{self.name} removed his card '#{card.card_title}' from the list '#{list.list_title}'."
    list.remove_card(card)
  end

  def add_content(card)
    card.add_content
    loop do
      puts "Do you want to add something else? (Y/N)"
      answer = gets.chomp.capitalize
      break if answer != "Y"
      card.add_content
    end
  end

  def move_card_to_another_position( list, card, new_position)
    puts "\nUser #{self.name} moved the card '#{card.card_title}' on the list '#{list.list_title}', to #{new_position} position.\n"
    list.change_card_position(card, new_position)
  end

  def move_card_to_another_list(card, now_list, new_list)
  puts "\nUser #{self.name} moved the card '#{card.card_title}' from the list '#{now_list.list_title}', on the list '#{new_list.list_title}'.\n"
    now_list.cards.delete(card)
    card.current_list = nil
    new_list.cards << card
    card.current_list = new_list
  end

  def add_comment(card)
    comment = card.add_comment(self)
    puts "\nThe following comment:'#{comment.text}' from the #{comment.author} has been added to the card '#{card.card_title}'"
    comment
  end

  def remove_comment(comment, card)
    puts "\nUser #{self.name} removed his comment from the card '#{card.card_title}'.\n"
    card.remove_comment(comment)
  end

  def to_s
  "user #{@name}"
  end

end