require 'colorize'

# contains the logic for the codebreaker
class Codebreaker
  def initialize
    puts 'Codebreaker, please select your name!'
    @name = gets.chomp
  end

  def guess_code(code_length)
    puts "\nPlease make a guess #{@name}"
    puts "\nYour choices are:"
    puts ['red'.colorize(:red), 'yellow'.colorize(:yellow), 'green'.colorize(:green), 'blue'.colorize(:blue),
          'purple'.colorize(:magenta)]
    puts "\nPlease only enter the first letter of the color".colorize(:red)
    guess = gets.chomp
    if guess.length < code_length || guess.length > code_length
      puts 'Your code was too long/short, pease guess again'.colorize(background: :red)
      guess_code(code_length)
    else
      guess = guess.chars
    end
  end
end
