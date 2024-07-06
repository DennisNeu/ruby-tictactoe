require_relative 'gameboard'
require_relative 'player'

class Game
  def initialize
    @gameboard = Gameboard.new
    @player1 = Player.new("x")
    @player2 = Player.new("o")
  end

  def run_game
    while true
      @gameboard.draw_board
      if check_full_board
        end_game("full")
      end

    end
  end

  private

  def end_game(param)
    if param == "full"
      puts "Game is over. Board is full"
    end
  end

  def check_victory

  end

  def get_player_choice(player)

  end

  def check_full_board
    @gameboard.each do |row|
      if row.any?(' ')
        return true
      end
    end
  end
end
