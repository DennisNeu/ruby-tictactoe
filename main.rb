require_relative "lib/gameboard"

gameboard = Gameboard.new

gameboard.draw_board

gameboard.update_board("x", 6)

gameboard.update_board("x", 6)

gameboard.draw_board
