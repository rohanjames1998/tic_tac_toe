class Player
  attr_accessor :name, :symbol

  def initialize()
    puts "Please enter a name"
    @name = get_name
    puts "#{name}, please chose your symbol"
    @symbol = get_symbol
  end

  def get_symbol
    loop do
      player_symbol = gets.chomp
      case
      when player_symbol.length > 1
        puts "You can only have one character as your symbol."
        next
      when /[0-9]/.match(player_symbol)
        puts "Your symbol can't be an Integer"
        next
      when player_symbol.length == 0 || /\s+/.match(player_symbol)
        puts "Your symbol cannot be empty"
        next
      else
        return player_symbol
      end
    end
  end

  def get_name
    loop do
      player_name = gets.chomp.capitalize
      if player_name.length > 10
        puts "Please keep your name under 10 characters"
        next
      elsif player_name.length == 0 || /\s+/.match(player_name)
        puts "Your name cannot be blank",
             "Please enter a valid name"
        next
      else
        return player_name
      end
    end
  end
end
