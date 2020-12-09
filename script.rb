class Box
  def initialize(mark)
    @is_empty = true
    @mark = mark
  end

  def check_empty
    @is_empty
  end

  def change_mark(mark)
    @mark = mark
    @is_empty = false
  end

  def get_mark
    @mark
  end
end

class Player
  def initialize(mark)
    @player_mark = mark
  end

  def pick_box
    puts "Pick a box number"
    box_number = gets.chomp
    box_index = box_number.to_i - 1
    if $board_objects[box_index].check_empty
      $board_objects[box_index].change_mark(@player_mark)
    else
      puts "Box is already taken"
      pick_box()
    end
  end
end

def display_board(objects)
  $game_board = []
  i = 0
  9.times do
    $game_board.push(objects[i].get_mark)
    i = i+1
  end
  first_line_arr = [$game_board[0], $game_board[1], $game_board[2]]
  first_line = first_line_arr.join(" ")
  second_line_arr = [$game_board[3], $game_board[4], $game_board[5]]
  second_line = second_line_arr.join(" ")
  third_line_arr = [$game_board[6], $game_board[7], $game_board[8]]
  third_line = third_line_arr.join(" ")
  puts first_line
  puts second_line
  puts third_line
end


# This creates the Box instances and populates the array
def set_board
  i = 1
  9.times do
    $board_objects.push(Box.new(i))
    i = i+1
  end
  display_board $board_objects
end

def check_status
  if $game_board[0] == 'X' && $game_board[1] == 'X' && $game_board[2] == 'X'
    puts "Player 1 Wins!"
    $is_finished = true
  elsif $game_board[0] == 'X' && $game_board[4] == 'X' && $game_board[8] == 'X'
    puts "Player 1 Wins!"
    $is_finished = true
  elsif $game_board[2] == 'X' && $game_board[4] == 'X' && $game_board[6] == 'X'
    puts "Player 1 Wins!"
    $is_finished = true
  elsif $game_board[3] == 'X' && $game_board[4] == 'X' && $game_board[5] == 'X'
    puts "Player 1 Wins!"
    $is_finished = true
  elsif $game_board[6] == 'X' && $game_board[7] == 'X' && $game_board[8] == 'X'
    puts "Player 1 Wins!"
    $is_finished = true
  elsif $game_board[0] == 'X' && $game_board[3] == 'X' && $game_board[6] == 'X'
    puts "Player 1 Wins!"
    $is_finished = true
  elsif $game_board[1] == 'X' && $game_board[4] == 'X' && $game_board[7] == 'X'
    puts "Player 1 Wins!"
    $is_finished = true
  elsif $game_board[2] == 'X' && $game_board[5] == 'X' && $game_board[8] == 'X'
    puts "Player 1 Wins!"
    $is_finished = true
  elsif $game_board[0] == 'O' && $game_board[1] == 'O' && $game_board[2] == 'O'
    puts "Player 2 Wins!"
    $is_finished = true
  elsif $game_board[0] == 'O' && $game_board[4] == 'O' && $game_board[8] == 'O'
    puts "Player 2 Wins!"
    $is_finished = true
  elsif $game_board[2] == 'O' && $game_board[4] == 'O' && $game_board[6] == 'O'
    puts "Player 2 Wins!"
    $is_finished = true
  elsif $game_board[3] == 'O' && $game_board[4] == 'O' && $game_board[5] == 'O'
    puts "Player 2 Wins!"
    $is_finished = true
  elsif $game_board[6] == 'O' && $game_board[7] == 'O' && $game_board[8] == 'O'
    puts "Player 2 Wins!"
    $is_finished = true
  elsif $game_board[0] == 'O' && $game_board[3] == 'O' && $game_board[6] == 'O'
    puts "Player 2 Wins!"
    $is_finished = true
  elsif $game_board[1] == 'O' && $game_board[4] == 'O' && $game_board[7] == 'O'
    puts "Player 2 Wins!"
    $is_finished = true
  elsif $game_board[2] == 'O' && $game_board[5] == 'O' && $game_board[8] == 'O'
    puts "Player 2 Wins!"
    $is_finished = true
  else
    num_full = 0
    for mark in $board_objects
      if !mark.check_empty
        num_full = num_full + 1
      end
    end
    if num_full == 9
      puts "It's a Cat's Game!"
      $is_finished = true
    end
  end
end

def game
  $is_finished = false
  $board_objects = []
  player_1 = Player.new('X')
  player_2 = Player.new('O')
  set_board
  until $is_finished
    player_1.pick_box
    display_board $board_objects
    check_status()
    if $is_finished
      break
    end
    player_2.pick_box
    display_board $board_objects
    check_status()
  end
  puts "Play Again? y/n"
  answer = gets.chomp
  if answer == 'n'
    puts "See you later!"
  elsif answer == 'y'
    game()
  end
end

game
