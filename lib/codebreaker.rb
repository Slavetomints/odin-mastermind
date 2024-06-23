# frozen_string_literal: true

require 'colorize'

# contains the logic for the codebreaker
class Codebreaker
  def initialize(mode)
    @mode = mode
    case @mode
    when 'human'
      puts 'Codebreaker, please select your name!'
      @name = gets.chomp
    end
    
  end

  def guess_code(code_length)
    puts 'guessing the code'
    case @mode
    when 'human'
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
        guess.chars
      end
    when 'computer'
      puts 'computer is guessing the code'
      colors = %w[r o g b p]
      guess = []
      code_length.to_i.times do
        puts code_length
        puts 'computer is makin ghte guess'
        sample = colors.sample
        guess << sample
        colors.delete(sample)
        puts guess
      puts 'returning the guess'
      puts guess
      puts guess.class
      return guess
      end
    end
  end
end
