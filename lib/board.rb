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
    if @guesses_left == 0
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
    result_array = []
    code.each_with_index do |code_color, code_color_index|
      puts "\nColor: #{code_color}" 
      puts "Index: #{code_color_index}"

      guess.each_with_index do |guess_color, guess_color_index|
        if code_color == guess_color && code_color_index == guess_color_index  
          result_array << "CC"
          break
        elsif code_color == guess_color && code_color_index != guess_color_index
          result_array << "CW"
          break
        else
          result_array << "WW"
          break
        end
      end
    end
    result_array
  end
end
