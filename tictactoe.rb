# 1. Come up with requirements/specifications, which will determine the scope.
# 2. Application logic; sequence of steps
# 3. Translation of those steps into code
# 4. Run code to verify logic.

def initialize_board
	board = {}
	(1..9).each {|position| board[position] = ' '}
	return board
end

def draw_board(board)
	system 'clear'
	puts "#{b[1]}|#{b[2]}|#{b[3]}"
	puts "_____"
	puts "#{b[4]}|#{b[5]}|#{b[6]}"
	puts "_____"
	puts "#{b[7]}|#{b[8]}|#{b[9]}"
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
	b[position] = 'O' 
end

def check_winner(board)
	winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
	winning_lines.each do |line|
		return 'Player' if board.values_at(*line).count('X') == 3
		return 'Computer' if board.values_at(*line).count('O') == 3
	end
	nil	
end

def nine_positions_are_filled?(board)
  empty_positions(board) == []
end

def announce_winner(winner)
	puts "#{winner} won!"	
end

board = initialize_board
draw_board(board)
begin
	player_picks_square(board)
	draw_board(board)
	computer_picks_square(board)
	draw_board(board)
	winner = check_winner(board)
end until winner || nine_positions_are_filled?(board)
if winner
	announce_winner(winner)
else
	puts "It's a tie!"
end


# things to improve on
# show available square
# need to put available position
# AI
# loop invalid answers
# something is wrong with the check_winner







