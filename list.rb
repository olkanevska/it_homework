require 'faker'
require_relative 'card'
class List

  attr_reader :list_title, :board, :cards

  def initialize(list_title, board)
   @list_title = list_title
   @cards = []
   @board = board
  end

  def add_card(card_title,user)
   card = Card.new(card_title,self, user)
   @cards << card
   card
  end

  def info_card(user)
    print "\nNow the user #{user.name} has list: '#{@list_title}'"
    if @cards.size != 0
     print"  with the following card(s): \n"
     @cards.each {|card| puts card}
    else
      print " without card.\n"
    end
  end
# мне нужно взять определееную карточку и передвинуть ее на определеный индекс в массиве. И ту карточку которая была на этом индексе передвинуть на один индекс в ту сторону с которой пришла определенная карточка)
  def change_card_position(card, new_position)
    @cards.delete(card)
    @cards.insert(new_position-1,card)
    new_position = @cards.index(card)+1
  end

  def remove_card(card)
    @cards.delete(card)
  end

  def to_s
    "\n'#{@list_title}', on board : '#{@board.board_name}'\n"
  end
 end
