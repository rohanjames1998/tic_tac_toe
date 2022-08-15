require 'pry-byebug'

# ------------------------#
# CLASSES
# ------------------------#
class Player
    attr_accessor :name, :symbol
    def initialize(name)
        @name = name
    end

    def symbol=(character)
        @symbol = character
    end
end

# ------------------------#
# MODULES
# ------------------------#


# ------------------------#
# GAME FUNCTION
# ------------------------#

loop do
  quit_game = false
  puts "Hello there! Welcome to Tic Tac Toe!", \
       "Please enter your name"









  break if quit_game == true
end
