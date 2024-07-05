class Gameboard
  attr_accessor :board

  def initialize
    @board = Array.new(3) { Array.new(3, ' ') }
  end

  def draw_board
    board.each do |row|
      row.each do |column|
        puts "#{column} |"
      end
    end
    puts "___________"
  end
end
