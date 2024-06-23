# frozen_string_literal: true

# contains the logic for the codemaker
class Codemaker
  def initialize(code_length, mode)
    @mode = mode
    @code_length = code_length
    case @mode
    when 'human'
      puts 'Codemaker, please select your name!'
      @name = gets.chomp
    end  
  end

  def make_code
    colors = %w[r o g b p]
    code = []
    case @mode
    when 'computer'
      @code_length.times do
        insert = colors.sample
        colors.delete(insert)
        code << insert
      end
    when 'human'
      puts "Please pick a code from the following, with NO spaces: #{colors}"
      code = gets.chomp.chars
    end
    code
  end

  def check_guess(guess, check)
    return false unless guess == check

    puts 'You win!'
    exit
  end
end
