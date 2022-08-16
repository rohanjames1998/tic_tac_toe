require 'pry-byebug'

# ------------------------#
# MODULES
# ------------------------#
module CheckFunctions
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
    when grid[2] == grid[5] && grid[5] == grid[6] #2,5, and 8
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

  def place_symbol
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
end
# ------------------------#
# CLASSES
# ------------------------#
class Game
  include  CheckFunctions

  attr_reader :end_game

  @@rounds = 0
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
      puts "#{name}, please enter a number to place your symbol(#{symbol})",
      "      #{@@game_grids[1]} | #{@@game_grids[2]} | #{@@game_grids[3]}
      --+---+--
      #{@@game_grids[4]} | #{@@game_grids[5]} | #{@@game_grids[6]}
      --+---+--
      #{@@game_grids[7]} | #{@@game_grids[8]} | #{@@game_grids[9]}
      "
      @@game_grids[place_symbol] = symbol
      @@rounds += 1
      case true
      when is_winner?(@@game_grids)
        puts "Congratulations #{name}! You have Won the GAME!!!"
        @@end_game = true
        return
      when @@rounds == 9
        puts "This game was a draw. Wanna try again?"
       @@end_game = true
       return
      end
  end

  def self.end_game?
  @@end_game
  end
end

class Player < Game
  include  CheckFunctions


  attr_accessor :name, :symbol

  def initialize()
    puts "Please enter a name"
    name = gets.chomp.capitalize
    puts "#{name}, please chose your symbol"
    symbol = gets.chomp
      @name = name
      @symbol = symbol
    end
end



# ------------------------#
# GAME FUNCTION
# ------------------------#

puts "Hello there! Welcome to Tic Tac Toe!",
     "Player 1"
     p1 = Player.new
puts  "Player 2"
     p2 = Player.new
    quit_game = false
    # Game Loop
    #We need to check after each round to see if someone has won or if its a draw.
    loop do
      p1.round
     break if Game.end_game? == true
     p2.round
     break if Game.end_game? == true
    end


