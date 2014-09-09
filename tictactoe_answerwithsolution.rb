# this is like a controller
def initialize_board
  board = {}
  (1..9).each {|position| board[position] = ' '}
  return board
end

# this is like a view
def draw_board(board)
  system 'clear'
  puts "#{b[1]}|#{b[2]}|#{b[3]}"
  puts "------"
  puts "#{b[4]}|#{b[5]}|#{b[6]}"
  puts "------"
  puts "#{b[7]}|#{b[8]}|#{b[9]}"
  puts "------"
end

def empty_positions(board)
  board.keys.select {|position| board[position] == ' '}
end

def player_picks_square(board)
  begin
    puts "Pick a square (1-9):"
    position = gets.chomp.to_i
  end until empty_positions(board).include?(position)
  board[position] = 'X'
end

def computer_picks_square(board)
  position = empty_positions(board).sample
  board[position] = 'O'
end

def check_winner(board)
  winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  winning_lines.each do |line|
    return 'Player' if board.values_at(*line).count('X') == 3
    return 'Computer' if board.values_at(*line).count('X') == 3
  end
  nil 	
end

def nine_positions_are_filled?(board)
  empty_positions(board) == [] #empty board
end

def announce_winner(winner)
  puts "#{winner} won!"
end

board = initialize_board
  draw_board(board)
  begin
    player_picks_square(board)
    draw_board(board)
    computer_picks)square(board)
    draw_board(board)
    winner = check_winner(board)
  end until winner || nine_positions_are_filled?(board)
  if winner
    announce_winner(winner)
  else
    puts "Its a tie!"
end