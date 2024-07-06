class Player
  attr_reader :symbol

  def initialize(symbol)
    @symbol = symbol
  end

  def get_player_choice
    begin
      puts "Please enter a number between 1 and 9:"
      input = gets.chomp

       # Check if the input is a valid integer
      if input.match?(/^\d+$/)
        number = input.to_i
      else
        number = nil
      end

    end while number.nil? || number < 1 || number > 9

    number - 1

  end
end
