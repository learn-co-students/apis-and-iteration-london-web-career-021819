def welcome
  puts "Welcome to Star Wars"
end
def options
  puts "Choose:"
  puts "Press 1 for list of all Star Wars films"
  puts "Press 2 for to search for a character"
  option = gets.strip.to_i
end
def get_character_from_user
  puts "please enter a character name"
  gets.strip.downcase
end
