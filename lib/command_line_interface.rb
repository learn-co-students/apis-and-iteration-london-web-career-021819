def welcome
  puts "Welcome to this Starwars character info"
end

def get_character_from_user
  puts "Please enter a character name:"
  name = gets.chomp
  return name
end
