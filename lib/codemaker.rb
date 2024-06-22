# contains the logic for the codemaker
class Codemaker
  def initialize(code_length)
    puts 'Codemaker, please select your name!'
    @name = gets.chomp
    @code_length = code_length
  end

  def make_code
    colors = %w[r o g b p]
    code = []
    @code_length.times do
      code << colors.sample
    end
    code
  end

  def check_guess(guess, check)
    return false unless guess == check

    puts 'You win!'
    exit
  end
end
