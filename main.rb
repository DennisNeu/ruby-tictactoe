require_relative "lib/gameboard"

gameboard = Gameboard.new

gameboard.draw_board

gameboard.update_board("y", 6)

gameboard.update_board("x", 1)

gameboard.update_board("x", 1)
gameboard.update_board("x", 1)
gameboard.update_board("x", 1)
gameboard.update_board("x", 1)
gameboard.update_board("x", 1)

gameboard.draw_board
