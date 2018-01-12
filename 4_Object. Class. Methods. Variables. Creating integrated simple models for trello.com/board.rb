require 'faker'
require_relative 'list'
class Board
  attr_reader :lists, :board_name

  def initialize(board_name)
    @board_name = board_name
    @lists = []
  end
  def add_list(list_title)
   list = List.new(list_title,self)
   @lists << list
   list
  end

  def rename(new_name)
    @board_name = new_name
  end

  def to_s
    "\n'#{@board_name}'"
  end
end