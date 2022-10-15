class Player
  attr_accessor :name, :symbol

  def initialize(name='', symbol='')
    @name = name
    @symbol = symbol
  end

    def get_name
      puts "Please enter your name."
      loop do
        player_name = gets.chomp.capitalize
        if player_name.length > 10
          puts "Please keep your name under 10 characters."
          next
        elsif player_name.length == 0 || /\s+/.match(player_name)
          puts "Your name cannot be blank.",
               "Please enter a valid name."
          next
        else
          @name = player_name
          return
        end
      end
    end

  def get_symbol
    puts "#{self.name} please choose a symbol."
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
        @symbol = player_symbol
        return
      end
    end
  end
end
