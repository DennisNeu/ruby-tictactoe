require_relative 'gameboard'
require_relative 'player'

class Game
  def initialize
    @gameboard = Gameboard.new
    @player1 = Player.new("x")
    @player2 = Player.new("o")
  end

  def run_game
    @gameboard.draw_board
    while true

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


      if check_victory(@player1.symbol)
        print_victory(@player1.symbol)
        break
      end

      if check_full_board
        end_game("full")
        break
      end

      begin
        @gameboard.update_board(@player2.symbol, @player2.get_player_choice)
      rescue
        puts "Cell is already taken"
        @gameboard.update_board(@player2.symbol, @player2.get_player_choice)
      end

      @gameboard.draw_board

      if check_victory(@player2.symbol)
        print_victory(@player2.symbol)
        break
      end
    end

  end

  private

  def print_victory(player_symbol)
    puts ""
    puts "#" * 9
    puts ""
    puts "Player: #{player_symbol} won!"
    puts ""
    puts "#" * 9
    puts ""
  end

  def end_game(param)
    if param == "full"
      puts "Game is over. Board is full"
    end
  end

  def check_victory(player_symbol)
    # Row
    @gameboard.board.each do |row|
      return true if row.all?(player_symbol)
    end
    # Column
    return true if @gameboard.board[0][0] == player_symbol && @gameboard.board[1][0] == player_symbol && @gameboard.board[2][0] == player_symbol
    return true if @gameboard.board[0][1] == player_symbol && @gameboard.board[1][1] == player_symbol && @gameboard.board[2][1] == player_symbol
    return true if @gameboard.board[0][2] == player_symbol && @gameboard.board[1][2] == player_symbol && @gameboard.board[2][2] == player_symbol
    # Diagonals
    return true if @gameboard.board[0][0] == player_symbol && @gameboard.board[1][1] == player_symbol && @gameboard.board[2][2] == player_symbol
    return true if @gameboard.board[0][2] == player_symbol && @gameboard.board[1][1] == player_symbol && @gameboard.board[2][0] == player_symbol
  end

  def check_full_board
    @gameboard.board.each do |row|
      return false if row.any?(" ")
    end
    true
  end
end
