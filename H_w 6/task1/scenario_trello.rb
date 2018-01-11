require_relative 'user'
require_relative 'board'
require_relative 'list'
require_relative 'card'
require_relative 'comment'

# create simple user
user1 = User.new
puts "\nThe user #{user1.name}, email: #{user1.email}, registered on the website Trello.com.\n"
user2 = User.new
puts "\nThe user #{user2.name}, email: #{user2.email}, registered on the website Trello.com.\n\n=================================================================\n"
sleep 3

# user creates a board
board_cooking = user1.add_board("I love cooking")
board_kids = user1.add_board("Happy kids")
user1.info_user_boards
user2.info_user_boards
puts "\n=================================================================\n"
sleep 5

# user creates a list
list_meat = user1.add_list(board_cooking,"Meat dishes")
list_diner = user1.add_list(board_cooking, "Dishes for dinner")
list_a_games = user1.add_list(board_kids,"Active games")
user1.info_user_lists
user2.info_user_lists
puts "\n=================================================================\n"
sleep 7

# user adds a card to list
card1 = user1.add_card("Pork chops",list_meat)
user1.add_content(card1)
card2 = user1.add_card("Hide and Seek", list_a_games)
user1.add_content(card2)
card3 = user1.add_card("Kotleta", list_meat)
user1.add_content(card3)
card4 = user1.add_card("Suvla",list_meat)
user1.add_content(card4)
user1.info_card_on_list(list_meat)
user1.info_card_on_list(list_diner)
user1.info_card_on_list(list_a_games)
puts "\n=================================================================\n"
sleep 4

# user adds a comment to card
comment1 = user2.add_comment(card1)
comment2 = user1.add_comment(card1)
puts "\n=================================================================\n"
sleep 7

# user removes a comment
user2.remove_comment(comment1, card1)
user1.remove_comment(comment2, card1)
puts "\n=================================================================\n"
sleep 5

# user moves a card to another list
user1.move_card_to_another_list(card1, list_meat , list_diner)
user1.info_card_on_list(list_meat)
user1.info_card_on_list(list_diner)
puts "\n=================================================================\n"
sleep 5

# user moves a card to another position on list
user1.move_card_to_another_position( list_meat, card4, 1)
user1.info_card_on_list(list_meat)
puts "\n=================================================================\n"
sleep 7

# user renames a board
user1.rename_board(board_cooking, "My recipes")
user1.info_user_boards
puts "\n=================================================================\n"
sleep 5

# user removes a card
user1.remove_card(list_meat, card3)
user1.info_card_on_list(list_meat)
puts "\n=================================================================\n"
sleep 5

# user removes a list
user1.remove_list(list_diner)
user1.info_user_lists
puts "\n=================================================================\n"
