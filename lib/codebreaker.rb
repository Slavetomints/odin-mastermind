# contains the logic for the codebreaker
class Codebreaker
  def initialize
    puts 'Codebreaker, please select your name!'
    @name = gets.chomp
  end

  def guess_code(code_length)
    puts "Please make a guess #{@name}"
    guess = gets.chomp
    if guess.length < code_length || guess.length > code_length
      puts "Your code was too long/short, pease guess again"
      guess_code
    else
      guess = guess.chars
    end
  end
end
