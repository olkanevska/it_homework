require_relative "user"
require_relative "board"
require_relative "list"
require "test/unit"
require "rspec"

class TestUser < Test::Unit::TestCase
  include RSpec::Matchers
  def test_add_board
    user = User.new
    board = user.add_board("car")
    expect(user.boards).to include board
  end

  def test_rename_board
    user = User.new
    board = user.add_board("car")
    expect("avto").to eql user.rename_board(board, "avto")
  end

  def test_add_list
    user = User.new
    board = user.add_board("cars")
    list = user.add_list(board,"car")
    expect(board.lists).to include list
  end

  def test_add_card
    user = User.new
    board = user.add_board("cars")
    list = user.add_list(board,"car")
    card = user.add_card("volga",list)
    expect(list.cards).to include card
  end

  def test_add_comment
    user = User.new
    board = user.add_board("cars")
    list = user.add_list(board,"car")
    card = user.add_card("volga",list)
    comment = user.add_comment(card)
    expect(card.comments).to include comment
  end

  def test_removes_comment
    user = User.new
    board = user.add_board("cars")
    list = user.add_list(board,"my car")
    card = user.add_card("shcoda",list)
    comment = user.add_comment(card)
    user.remove_comment(comment, card)
    expect(card.comments).not_to include comment
  end

  def test_move_card_to_another_list
    user = User.new
    board = user.add_board("cars")
    now_list = user.add_list(board,"modern car")
    new_list = user.add_list(board,"retro car")
    card = user.add_card("volga",now_list)
    expect(new_list).to equal user.move_card_to_another_list(card, now_list,new_list)
  end

  def test_move_card_to_another_position
   user = User.new
   board = user.add_board("cars")
   list = user.add_list(board,"my car")
   card1 = user.add_card("shcoda",list)
   card2 = user.add_card("volga",list)
   expect(2).to equal user.move_card_to_another_position(list,card1,2)
  end

  def test_remove_card
    user = User.new
    board = user.add_board("cars")
    list = user.add_list(board,"my car")
    card = user.add_card("shcoda",list)
    user.remove_card(list, card)
    expect(list.cards).not_to include card
  end

  def test_remove_list
    user = User.new
    board = user.add_board("cars")
    list = user.add_list(board,"my car")
    user.remove_list(list)
    expect(board.lists).not_to include list
  end

end
