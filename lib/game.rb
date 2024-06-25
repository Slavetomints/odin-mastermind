# frozen_string_literal: true

require_relative 'board'
require_relative 'codemaker'
require_relative 'codebreaker'

# contains the game logic
class Game
  def initialize
    puts 'How long will the code be?'
    @code_length = gets.chomp.to_i
    @board = Board.new(@code_length)
    puts 'Select to be the codemaker/codebreaker'
    @mode = gets.chomp

    case @mode
    when 'codemaker'
      @codemaker = Codemaker.new(@code_length, 'human')
      @codebreaker = Codebreaker.new('computer')
    when 'codebreaker'
      @codemaker = Codemaker.new(@code_length, 'computer')
      @codebreaker = Codebreaker.new('human')
    end

    @code = @codemaker.make_code
    puts 'Welcome!'
    @board.show_board
  end

  def play_game
      guess = @codebreaker.guess_code(@code_length)
      return unless @codemaker.check_guess(guess, @code) == false
      @board.update_board(guess, @code)
  end
end
