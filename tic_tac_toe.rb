require 'pry-byebug'

# ------------------------#
# CLASSES
# ------------------------#
class Game
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
      "    #{@@game_grids[1]} | #{@@game_grids[2]} | #{@@game_grids[3]}
      --+---+--
      #{@@game_grids[4]} | #{@@game_grids[5]} | #{@@game_grids[6]}
      --+---+--
      #{@@game_grids[7]} | #{@@game_grids[8]} | #{@@game_grids[9]}
      "
      @@game_grids[gets.to_i] = symbol
    @@rounds += 1
  end
end

class Player < Game

  private

  attr_accessor :name, :symbol
  def initialize()
    puts "Please enter a name"
    name = gets.chomp.capitalize
    puts "#{name}, please chose your symbol"
    symbol = gets.chomp.to_s
      @name = name
      @symbol = symbol
    end
end

# ------------------------#
# MODULES
# ------------------------#


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

