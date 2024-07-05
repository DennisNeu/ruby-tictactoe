class Gameboard
  attr_accessor :board

  def initialize
    @board = Array.new(3) { Array.new(3, ' ') }
  end

  def draw_board
    @board.each_with_index do |row, row_index|
      row.each_with_index do |cell, cell_index|
        if cell_index == row.length - 1
          print cell
        else
          print cell + ' | '
        end
      end
      print "\n"
      puts '-' * 9 unless row_index == @board.length - 1
    end
  end
end
