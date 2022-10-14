class Player
  attr_accessor :name, :symbol

  def initialize()
    puts "Please enter a name"
    @name = get_name
    puts "#{name}, please chose your symbol"
    @symbol = get_symbol
  end
end
