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
      colors = %w[r o g b p]
      guess = Array.new
      i = 0
      while i < code_length do
        sample = colors.sample
        guess << sample
        colors.delete(sample)
        i += 1
      end
      guess
    end
  end
end
