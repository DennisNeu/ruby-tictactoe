require_relative 'gameboard'
require_relative 'player'

class Game
  def initialize
    @gameboard = Gameboard.new
    @player1 = Player.new("x")
    @player2 = Player.new("o")
  end
end
