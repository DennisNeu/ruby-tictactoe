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
      begin
        @gameboard.update_board(@player1.symbol, @player1.get_player_choice)
      rescue
        puts "Cell is already taken"
        @gameboard.update_board(@player1.symbol, @player1.get_player_choice)
      end
      @gameboard.draw_board
      if check_full_board
        end_game("full")
      end
      begin
        @gameboard.update_board(@player2.symbol, @player2.get_player_choice)
      rescue
        puts "Cell is already taken"
        @gameboard.update_board(@player2.symbol, @player2.get_player_choice)
      end

    end
  end

  private

  def end_game(param)
    if param == "full"
      puts "Game is over. Board is full"
    end
  end

  def check_victory(player_symbol)
    @gameboard.board.each
  end

  def check_full_board
    @gameboard.board.each do |row|
      return false if row.any?(" ")
    end
    true
  end
end
