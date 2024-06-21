require_relative 'board'
require_relative 'codemaker'
require_relative 'codebreaker'

# contains the game logic
class Game
  def initialize
    puts 'How long will the code be?'
    @code_length = gets.chomp.to_i
    @board = Board.new(@code_length)
    @codemaker = Codemaker.new(@code_length)
    @codebreaker = Codebreaker.new
    @code = @codemaker.make_code
    puts 'Welcome!'
    @board.show_board
  end

  def play_game
    guess = @codebreaker.guess_code(@code_length)
    if @codemaker.check_guess(guess, @code) == false
      @board.update_board(guess, @code)
    end
  end
end

game = Game.new
String.colors
loop do
  game.play_game
end