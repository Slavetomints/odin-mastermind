# frozen_string_literal: true

require_relative 'lib/game.rb'

game = Game.new
loop do
  game.play_game
end