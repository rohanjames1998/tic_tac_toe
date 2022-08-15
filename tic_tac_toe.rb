require 'pry-byebug'

# ------------------------#
# CLASSES
# ------------------------#
class Game
  include  CheckFunctions
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

    def round
      puts "#{name}, please enter a number to place your symbol(#{symbol})",
      "      #{@@game_grids[1]} | #{@@game_grids[2]} | #{@@game_grids[3]}
      --+---+--
      #{@@game_grids[4]} | #{@@game_grids[5]} | #{@@game_grids[6]}
      --+---+--
      #{@@game_grids[7]} | #{@@game_grids[8]} | #{@@game_grids[9]}
      "
      @@game_grids[gets.to_i] = symbol
      @@rounds += 1
      case true
      when is_winner?
        puts "Congratulations #{name}! You have Won the GAME!!!"
      when rounds == 9
        puts "This game was a draw. Wanna try again?"
      end
  end
end

class Player < Game

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
# MODULES
# ------------------------#
module CheckFunctions
  def is_winner?
    #This function checks if 3 user symbol gets aligned together
    case true
      #For horizontal alignment
    when @@game_grids[1] == @@game_grids[2] && @@game_grids[2] == @@game_grids[3] #1, 2, and 3
    when @@game_grids[4] == @@game_grids[5] && @@game_grids[5] == @@game_grids[6] #4, 5, and 6
    when @@game_grids[7] == @@game_grids[8] && @@game_grids[8] == @@game_grids[9] #7, 8, and 9
     #For vertical alignment
    when @@game_grids[1] == @@game_grids[4] && @@game_grids[4] == @@game_grids[7] #1,4, and 7
    when @@game_grids[2] == @@game_grids[5] && @@game_grids[5] == @@game_grids[6] #2,5, and 8
    when @@game_grids[3] == @@game_grids[6] && @@game_grids[6] == @@game_grids[9] #3,6, and 9
      #For cross alignment
    when @@game_grids[1] == @@game_grids[5] && @@game_grids[5] == @@game_grids[9] #1,5, and 9
    when @@game_grids[3] == @@game_grids[5] && @@game_grids[5] == @@game_grids[7] #3,5, and 7
      return true
    else
      return false
    end
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

loop do
  quit_game = false

       p1.round
       p2.round

  break if quit_game == true
end

