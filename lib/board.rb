require 'colorize'

# contains the logic based around the game "board"
class Board
  attr_accessor :guess_board

  def initialize(code_length)
    puts 'How many turns will the guesser need?'
    @number_of_turns = gets.chomp.to_i
    @guesses_left = @number_of_turns
    @guess_board = Array.new(@number_of_turns) { Array.new(code_length, '-') }
    @result_board = Array.new(@number_of_turns) { Array.new(code_length, '-') }
  end

  def show_board
    i = 0
    while i < @number_of_turns
      puts "#{@guess_board[i]}  #{@result_board[i]}"
      i += 1
    end
  end

  def update_board(guess, code)
    @guesses_left -= 1
    @guess_board[@guesses_left] = guess
    @result_board[@guesses_left] = code
    self.show_board
  end
end
