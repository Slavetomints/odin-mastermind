# contains the logic for the codemaker
class Codemaker
  def initialize(code_length)
    puts 'Codemaker, please select your name!'
    @name = gets.chomp
    @code_length = code_length
  end

  def make_code
    color = %w[r y g b]
    code = []
    @code_length.times do
      code << color.sample
    end
    p code
  end
end
