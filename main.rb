require_relative("room.rb")
require_relative("guest.rb")
require_relative("song.rb")
require("pry")

def get_input()
  p "Would you like to add a guest? (Y/N)"
  answer = gets.chomp.downcase
# binding.pry
  if answer == "y"
    n = 1
    p "What is their name?"
    name = gets.chomp.downcase
    p "How much cash to they have?"
    cash = gets.chomp
    "Jimmi" + n.to_s = Guest.new(name, cash)

  else
    p "Nope..."
  end


end

get_input

room.check_in_guest
