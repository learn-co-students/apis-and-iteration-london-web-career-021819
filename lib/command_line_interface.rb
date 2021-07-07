require "pry"

def welcome
  # puts out a welcome message here!
  puts "Welcome"
end

def get_character_from_user
  puts "Please enter a character name:"
  gets.chomp.downcase
end
