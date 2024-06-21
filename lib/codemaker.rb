# contains the logic for the codemaker
class Codemaker
  def initialize(code_length)
    puts 'Codemaker, please select your name!'
    @name = gets.chomp
    @code_length = code_length
  end

  def make_code
    colors = %w[red yellow green blue purple]
    code = []
    @code_length.times do
      code << colors.sample
    end
    code
  end

  def check_guess(guess, check)
    if guess == check
      puts "You win!"
      exit
    else
      return false
    end
  end
end
