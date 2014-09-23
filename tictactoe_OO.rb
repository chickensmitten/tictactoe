class Board
  def initialize
    @data = {}
    (1..9).each {|position| @data[position] = Square.new(' ')}
  end

  def draw
    puts "Drawing... board"
    puts @data.inspect
  end

  def all_squares_marked?
    empty_square.size == 0
  end

  def empty_squares
    @data.select { |_, square| square.empty == ' '}.values #reach into each square object and inspect its state. Need to get the @value. #return an array of empty squares. We do not want has, but values of the hash
  end

  def empty_positions
    @data.select {|_, square| square.empty? }.keys
  end

  def mark_square(position, marker)
    @data[position].mark(marker)
  end

end

class Square
  attr_accessor :value

  def initialize(value)
    @value = value
  end

  def mark(marker)
    @value = marker
  end

  def occupied?
    @value != ' '
  end

end

class Player

  attr_reader :marker

  def initialize (name, marker)
    @name = name
    @marker = marker
  end
end

class Game

  def initialize
    @board = Board.new
    @human = Player.new("Chris", "X")
    @computer = Computer.new("Hal-1000", "O")
    @current_player = @human
  end

  def current_player_marks_square
    if @current_player == @human
      begin
        puts "Choose a position #{@board.empty_positions} to place a piece:"
        position = gets.chomp.to_i
      end until @board.empty_positions.include?(position)
    else
      position = @board.empty_positions.sample
    end
    @board.mark_square(position, @current_player.marker) #need to get marker from player, hence attr_accessor from player.
  end

  def play
    @board.draw
    loop do
      current_player_marks_square #With a method, the same logic of tracking can be put into one method instead of two. by keeping track of who the player in an instance variable.
      @board.draw
      if current_player_wins?
        puts "The Winner is #{@current_player.name}!"
        break
      elsif @board.all_squares_marked?
        puts "It's a tie."
        break
      else
        alternate_player
      end
    end
    puts "Bye!"
  end

end


Game.new.play




































# class Player

#   attr_accessor :name 

#   def initialize(n)
#     @name = n
#   end

# end

# class Human < Player
#   def picks_square
#     begin
#       puts "Pick a square (1-9):"
#       position = gets.chomp.to_i
#     end until empty_positions(board).include?(position)
#     board[position] = 'X'
#   end
# end

# class Computer < Player
#   def picks_square
#     position = empty_positions(board).sample
#     board[position] = 'O'
#   end
# end


# class Board

#   def initialize_board
#     board = {}
#     (1..9).each {|position| board[position] = ' '
#     return board}
#   end

#   def draw_board
#     system 'clear'
#     puts "#{b[1]}|#{b[2]}|#{b[3]}"
#     puts "_______"
#     puts "#{b[4]}|#{b[5]}|#{b[6]}"
#     puts "_______"
#     puts "#{b[7]}|#{b[8]}|#{b[9]}"
#   end

#   def empty_positions(board)
#     board.keys.select {|position| board[position] == ' '}
#   end

# end

# class Game

# WINNING_LINES = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]

#   def check_winner(winner)
#     winning_lines.each do |line|
#       return 'Human' if board.values_at(*line).count('X') == 3
#       return 'Computer' if board.values_at(*line).count('O') == 3
#     end
#     nil 
#   end

#   def nine_positions_filled?(board)
#     empty_postiions(board) == []
#   end

#   def announce_winner(winner)
#     puts "#{winner} won!"
#   end

#   def Play

#     def initialize
#       @board = Board.new
#       @human = Player.new("Jane")
#       @computer = Player.new("Neo")
#     end    

#     def play
#       board.draw_board
#         begin
#           human.picks_square
#           computer.picks_square
#           game.check_winner
#           game.nine_positions_filled
#         end while winner || nine_positions_filled?(board)
#       if winner
#         announce_winner(winner)
#       else
#         puts "It's a tie!"
#       end
#     end
#   end

# end

# play = Play.new

