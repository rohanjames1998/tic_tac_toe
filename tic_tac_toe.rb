require 'pry-byebug'

# ------------------------#
# CLASSES
# ------------------------#
class Game
	attr_accessor :sym
  def round
    @sym = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    puts "#{name}, please enter a number to place your symbol",
         "    #{sym[0]} | #{sym[1]} | #{sym[2]}
    --+---+--
    #{sym[3]} | #{sym[4]} | #{sym[5]}
    --+---+--
    #{sym[6]} | #{sym[7]} | #{sym[8]}
"
  end
end

class Player < Game

  private

  attr_accessor :name, :symbol
  def initialize()
    puts "Please enter a name"
    name = gets.chomp.capitalize
    puts "Please chose your symbol"
    symbol = gets.chomp
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

new_game = true
loop do
  quit_game = false
  if new_game == true
  puts "Hello there! Welcome to Tic Tac Toe!"
       p1 = Player.new
       p2 = Player.new
       new_game = false
  end
			#  p1.round










  break if quit_game == true
end

