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
          print "#{cell} | "
        end
      end
      print "\n"
      puts '-' * 9 unless row_index == @board.length - 1
    end
  end

  def update_board(player, cell_index)
    raise 'Invalid player' unless player == 'x' || player == 'o'

    row = determine_row(cell_index)
    cell = determine_cell(cell_index)

    raise 'Cell is not empty!' unless @board[row][cell] == ' '

    @board[row][cell] = player
  end

  private

  def determine_row(cell_index)
    raise 'Invalid cell index' unless cell_index.between?(0, 8)

    cell_index / 3
  end

  def determine_cell(cell_index)
    raise 'Invalid cell index' unless cell_index.between?(0, 8)

    cell_index % 3
  end
end
