# frozen_string_literal: true

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
    puts "-------------------"
    while i < @number_of_turns
      puts "#{@guess_board[i]}  #{@result_board[i]}"
      i += 1
    end
    puts "-------------------"
  end

  def update_board(guess, code)
    @guesses_left -= 1
    if @guesses_left.zero?
      show_board
      puts "You loose! The code was #{code}"
      exit
    else
      @guess_board[@guesses_left] = guess
      @result_board[@guesses_left] = update_results(guess, code)
      show_board
    end
  end

  def update_results(guess, code)
    code_length = code.length
    result_array = Array.new(code_length)
    matched_indices = Array.new(code_length, false)

    guess.each_with_index do |guess_color, guess_color_index|
      next unless code[guess_color_index] == guess_color

      result_array.shift
      result_array << 'CC'
      matched_indices[guess_color_index] = true

      next if result_array[guess_color_index] == 'CC'

      code.each_with_index do |code_color, code_color_index|
        next if matched_indices[code_color_index]

        next unless guess_color == code_color

        result_array.shift
        result_array << 'CW'
        matched_indices[code_color_index] = true
        break
      end
    end

    result_array.each_with_index do |result, index|
      result_array[index] = 'WW' if result.nil?
    end
    result_array
  end
end
