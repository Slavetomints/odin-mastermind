require 'colorize'

# contains the logic based around the game "board"
class Board
  attr_accessor :guess_board

  def initialize(code_length)
    puts 'How many turns will the guesser need?'
    @number_of_turns = gets.chomp.to_i
    @guess_board = Array.new(@number_of_turns) { Array.new(code_length, 'g') }
    @result_board = Array.new(@number_of_turns) { Array.new(code_length, 'r') }
  end

  def show_board
    i = 0
    while i < @number_of_turns
      puts "#{@guess_board[i]}  #{@result_board[i]}"
      i += 1
    end
  end
end
