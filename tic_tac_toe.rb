require 'pry-byebug'

# ------------------------#
# MODULES
# ------------------------#
module GameFunctions
  def is_winner?(grid)
    #This function checks if 3 user symbol gets aligned together
    case true
      #For horizontal alignment
    when grid[1] == grid[2] && grid[2] == grid[3] #1, 2, and 3
      return true
    when grid[4] == grid[5] && grid[5] == grid[6] #4, 5, and 6
      return true
    when grid[7] == grid[8] && grid[8] == grid[9] #7, 8, and 9
      return true
     #For vertical alignment
    when grid[1] == grid[4] && grid[4] == grid[7] #1,4, and 7
      return true
    when grid[2] == grid[5] && grid[5] == grid[8] #2,5, and 8
      return true
    when grid[3] == grid[6] && grid[6] == grid[9] #3,6, and 9
      return true
      #For cross alignment
    when grid[1] == grid[5] && grid[5] == grid[9] #1,5, and 9
      return true
    when grid[3] == grid[5] && grid[5] == grid[7] #3,5, and 7
      return true
    else
      return false
    end
  end

  def symbol_place
    loop do
      place = gets
     if /[0-9]/.match(place)
      return place.to_i
     else
      puts "#{name}, please enter a number between 1 and 9 to place your symbol"
      next
     end
    end
  end

  def place_symbol_on_grid(grid)
    loop do
    place = symbol_place
    if grid[place].is_a?(Integer)
      return grid[place] = symbol
    else
      puts "Sorry that place already contains a symbol. Please select a new place."
      next
    end
    end
  end

  def get_symbol
    loop do
      player_symbol = gets.chomp
      if player_symbol.length > 1
        puts"You can only have one character as your symbol."
        next
      elsif  /[0-9]/.match(player_symbol)
        puts "Your symbol can't be an Integer"
        next
      else
        return player_symbol
      end
    end

    def duplicate_symbol(p2)
      
  end
  end

    def get_name
      loop do
        player_name = gets.chomp.capitalize
        if player_name.length > 10
          puts "Please keep your name under 10 characters"
          next
        else
          return player_name
        end
      end
    end
end
# Making GameFunctions module globally available for this game.
include  GameFunctions

# ------------------------#
# CLASSES
# ------------------------#
class Game

  attr_reader :end_game

  @@rounds = 0
  # Default values for game_grids
  @@game_grids = {1 => 1,
    2 => 2,
    3 => 3,
    4 => 4,
    5 => 5,
    6 => 6,
    7 => 7,
    8 => 8,
    9 => 9,}
    @@end_game = false

    def round
      #Grid for each round
      puts "\n#{name}, please enter a number to place your symbol(#{symbol})",
      "      #{@@game_grids[1]} | #{@@game_grids[2]} | #{@@game_grids[3]}
      --+---+--
      #{@@game_grids[4]} | #{@@game_grids[5]} | #{@@game_grids[6]}
      --+---+--
      #{@@game_grids[7]} | #{@@game_grids[8]} | #{@@game_grids[9]}
      "
      #Function that asks user to choose a grid to place symbol and checks if it is a valid
      #location and it doesnt already contain a symbol
      place_symbol_on_grid(@@game_grids)
      @@rounds += 1
      #Checks for winning and drawing conditions
      case true
      when is_winner?(@@game_grids)
        puts "\nCongratulations #{name}! You have Won the GAME!!!"
        @@end_game = true
        return
      when @@rounds == 9
        puts "\nIt's a draw :("
       @@end_game = true
       return
      end
  end

  def self.end_game?
  @@end_game
  end
end

class Player < Game


  attr_accessor :name, :symbol

  def initialize()
    puts "Please enter a name"
    @name = get_name
    puts "#{name}, please chose your symbol"
    @symbol = get_symbol
    end
end



# ------------------------#
# Game logic
# ------------------------#
puts "Hello there! Welcome to Tic Tac Toe!",
     "Player 1"
     p1 = Player.new
puts  "\nPlayer 2"
     p2 = Player.new
    # This loop checks for symbol duplications
     loop do
      if p2.symbol == p1.symbol
        puts "You cannot have the same symbol as your partner!!"
        puts "Please choose a different symbol"
        p2.symbol = get_symbol
        next
      else
        break
      end
    end
    # Game Loop
    #We need to check after each round to see if someone has won or if its a draw.
    loop do
      p1.round
     break if Game.end_game? == true
     p2.round
     break if Game.end_game? == true
    end


